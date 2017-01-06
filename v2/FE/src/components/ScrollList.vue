<template>
    <div class="com-scroll-list" @touchstart="touchStart" @touchmove="touchMove" @touchend="touchEnd">
        <div class="body" :class="{bounce: !is_pull_down}" :style="{transform: 'translate3d(0, ' + translate_y + 'px,' +'0)'}">
            <template>
                <div class="arrow" v-show="!is_loading">
                    <i class="icon" :class="{rotate: is_pull_down}"></i>
                    <p class="text">松开加载</p>
                </div>
                <loader :opts="{show: is_loading}"></loader>
            </template>
            <!-- list -->
            <!-- <transition-group class="list" name="list" tag="ul"  @before-enter="beforeEnter"> -->
            <transition-group :css="false" name="staggered-list" class="list" tag="ul" @before-enter="beforeEnter" @enter="enter">
                <li v-if="(list_already_length > i)" v-for="(row, i) in list_data" :key="i" :data-index="i" class="list-item">
                    <span class="category">[ {{row.category}} ]</span>
                    <router-link class="title" :to="{ name: 'detail', params: { id: row.id }}" tag="h1">
                        {{row.title}}
                    </router-link>
                    <p class="time">{{row.create_time}}</p>
                    <p class="desc" v-html="row.desc"></p>
                    <a @click="goDetail(row.id)" class="btn-view">查看全部</a>
                </li>
            </transition-group>
            <template>
                <!-- loader -->
                <loader :opts="{show: is_loading}"></loader>
                <!-- info -->
                <p v-show="page_ready == page_total" class="info">没有更多文章喽!</p>
            </template>
        </div>
    </div>
</template>
<script>
import Loader from './Loader'
import Velocity from 'velocity-animate'

export default {
    name: 'scrollList',
    data() {
        return {
            timer: null,
            list_data: [],
            page_each: 3, // 每页数
            page_total: 0, // 总页数
            page_ready: 1, // 已经读取的页数
            translate_y: 0, // 拖拽距离
            start_y: 0, // 起始距离
            start_scroll_top: 0, // 起始滚动条高度
            is_pull_down: false,
            is_loading: false
        };
    },

    created() {
        // 处理数据, dom还没有挂载到el指定的标签内
        // mounted: dom被挂载到指定el上
        // 初始化列表数据
        this.$store.dispatch('getList').then(() => {
            this.list_data = this.$store.state.list;
            this.page_total = Math.ceil(this.list_data / this.page_each);
        });

        // 滚动事件
        window.addEventListener('scroll', this.scrollList, false);
    },

    methods: {
        isListPosTop() {
            // 计算list组件距离浏览器顶部距离
            if (0 >= this.$el.getBoundingClientRect().top) {
                this.$store.commit('isListPosTop', true);
            } else {
                this.$store.commit('isListPosTop', false);
            }
        },

        scrollList() {
            // 到达末页
            if (this.page_ready >= this.page_total) {
                window.removeEventListener('scroll', this.scrollList);
            }

            clearTimeout(this.timer);
            this.timer = setTimeout(() => {
                // 判断是否列表的头部过了y=0
                this.isListPosTop();
                // window.scrollY: 滚动条高度
                // window.screen.availHeight: 可视区高度
                // *window.innerHeight 浏览器窗口高度
                // *document.body.scrollTop 滚动条滚动的距离
                // document.body.clientHeight: 文档高度
                if (window.screen.availHeight + window.scrollY + 50 >= document.body.clientHeight) {
                    if (this.page_ready < this.page_total) {
                        this.page_ready++;
                    }
                }
            }, 200);

        },

        touchStart(e) {
            this.is_pull_down = true;
            this.start_y = e.touches[0].clientY;
            this.start_scroll_top = this._getScrollTop();
        },

        touchMove(e) {
            // 移动距离 = 当前touch点的Y - touch起点Y - 初touch时候的滚动条高度
            var move_distance = e.touches[0].clientY - this.start_y - this.start_scroll_top;
            if (0 < move_distance && 0 == this._getScrollTop()) {
                this.translate_y = move_distance / 2;
                e.preventDefault();
                e.stopPropagation();
            }
        },

        touchEnd(e) {
            if (0 < this.translate_y) {
                this.is_pull_down = false;
                this.translate_y = 10;
                //触发数据拉取等操作
                this.is_loading = true;
                setTimeout(() => {
                    this.is_loading = false;
                    this.translate_y = 0;

                    this.list_data.splice(0, 0, {
                        "title": "本站代码",
                        "time": "2013-01-01 12:32:21",
                        "category": "javascript",
                        "id": "0",
                        "desc": "隐藏"
                    })

                }, 1000);
            }
        },

        beforeEnter(el) {
            el.style.webkitTransform = 'translateY(100px)';
            el.style.opacity = 0;
        },

        enter(el, done) {
            var index = el.dataset.index % this.$store.state.page_each;
            setTimeout(function() {
                Velocity(el, {
                    translateY: 0,
                    opacity: 1
                }, {
                    complete: done
                }, {
                    duration: 1000
                })
            }, index * 300)
        },

        _getScrollTop() {
            return window.pageYOffset;
        },

        goDetail(id) {
            // 记录当前滚动条位置
            this.$store.commit('setIndexPosY', window.scrollY);
            // goto
            this.$router.push({
                name: 'detail',
                params: {
                    id: id
                }
            })
        }
    },

    computed: {
        list_already_length() {
            // 已经显示的列表长度
            return this.$store.state.page * this.$store.state.page_each;
        }
    },

    components: {
        Loader
    }
}
</script>
<style scoped lang=scss>
.list-item {
    transition: all 1s;
    display: inline-block;
}

.list-enter-active,
.list-leave-active {
    transition: all 1s;
}

.list-enter,
.list-leave-active {
    opacity: 0;
    transform: translateY(-30px);
}

.bounce {
    transition: all .2s ease-in;
}

.rotate {
    transform: rotate(180deg);
}

$font_color: #444;
.com-scroll-list {
    overflow: hidden;
    >.body {
        >.arrow {
            height: 50px;
            margin-top: -50px;
            overflow: hidden;
            >.icon {
                transition: all .3s .3s;
                border-left: 0.1rem solid transparent;
                border-right: 0.1rem solid transparent;
                border-top: 0.15rem solid #ccc;
                width: 0;
                height: 0;
                display: block;
                margin: auto;
            }
            >.text {
                font-size: 0.14rem;
                color: #ccc;
                text-align: center;
                margin-top: 0.1rem;
            }
        }
        >.list {
            will-change: all;
            max-width: 720px;
            margin: 0.15rem auto;
            display: block;
            overflow: hidden;
            li {
                padding: 0.3rem 0.15rem;
                display: block;
                overflow: hidden;
                p,
                a {
                    font-size: 0.14rem;
                }
                a:visited {
                    text-decoration: none;
                    outline: none;
                    border: none;
                }
                .category {
                    display: inline-block;
                    padding: 0.05rem 0;
                    letter-spacing: 1px;
                    font-size: 0.2rem;
                }
                .title {
                    font-size: 0.2rem;
                    color: #333;
                    display: inline-block;
                    letter-spacing: 1px;
                    font-weight: 600;
                    cursor: pointer;
                }
                .desc {
                    margin-top: 0.15rem;
                    letter-spacing: 0.01rem;
                    color: $font_color;
                    display: block;
                    line-height: 1.5;
                    letter-spacing: 1px;
                }
                .time {
                    display: block;
                    color: $font_color;
                    letter-spacing: 1px;
                    height: 0.3rem;
                    line-height: 0.3rem;
                }
                .btn-view {
                    padding: 0.05rem;
                    margin-top: 0.3rem;
                    width: 0.7rem;
                    background: #999;
                    color: #fff;
                    clear: both;
                    cursor: pointer;
                    display: block;
                    text-align: center;
                    border-radius: 4px;
                    box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);
                }
            }
        }
        >.info {
            text-align: center;
            font-size: 0.14rem;
            color: #aaa;
            margin: 0.3rem auto;
        }
    }
}
</style>
