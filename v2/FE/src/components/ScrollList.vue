<template>
    <div class="com-scroll-list">
        <div class="body" :class="{bounce: !is_pull_down}" :style="{transform: 'translate3d(0, ' + translate_y + 'px,' +'0)'}">
            <template>
                <!-- loader -->
                <!-- <loader style="margin:-100px 0 0 0;" v-if="$store.state.list_loader"></loader> -->
                <!-- info -->
                <!-- <p v-else class="info">没有更多文章喽!</p> -->
                <!-- is_loading -->
                <div class="arrow" v-show="!is_loading">
                    <i class="icon" :class="{rotate: is_pull_down}"></i>
                    <p class="text">松开加载</p>

                </div>
                <loader :opts="{show: is_loading}"></loader>
            </template>
            <!-- list -->
            <transition-group class="list" name="list" tag="ul">
                <li v-if="(list_already_length > i)" v-for="(row, i) in list_data" :key="i" class="list-item">
                    <router-link class="title" :to="{ name: 'detail', params: { id: row.id }}" tag="h1">
                        {{row.title}}
                    </router-link>
                    <p class="desc" v-html="'[' + row.category + ']' + row.desc"></p>
                    <p class="time">{{row.create_time}}</p>
                    <router-link class="btn-view" :to="{ name: 'detail', params: { id: row.id }}" tag="a">查看全部</router-link>
                </li>
            </transition-group>
            <template>
                <!-- loader -->
                <loader :opts="{show: $store.state.list_loader}"></loader>
                <!-- info -->
                <p v-show="!$store.state.list_loader" class="info">没有更多文章喽!</p>
            </template>
        </div>
    </div>
</template>
<script>
import Loader from './Loader'
export default {
    name: 'scrollList',

    data() {
        return {
            page: 1,
            each: 3,
            page_total: 0,
            loading: true,
            list_data: [],
            translate_y: 0,
            start_y: 0,
            start_scroll_top: 0,
            is_pull_down: false,
            is_loading: false
        };
    },

    mounted() {
        var node_body = this.$el.childNodes[0];

        // touchstart
        node_body.addEventListener('touchstart', (e) => {
            this.is_pull_down = true;
            this.start_y = e.touches[0].clientY;
            this.start_scroll_top = this._getScrollTop();
        }, false);

        // touchmove
        node_body.addEventListener('touchmove', (e) => {
            // 移动距离 = 当前touch点的Y - touch起点Y - 初touch时候的滚动条高度
            var move_distance = e.touches[0].clientY - this.start_y - this.start_scroll_top;
            if (0 < move_distance && 0 == this._getScrollTop()) {
                this.translate_y = move_distance / 2;
                e.preventDefault();
                e.stopPropagation();
            }
        }, false);

        // touchend
        node_body.addEventListener('touchend', (e) => {
            if (0 < this.translate_y) {
                this.is_pull_down = false;
                this.translate_y = 10;
                //触发数据拉取等操作
                this.is_loading = true;
                setTimeout(() => {
                    this.is_loading = false;
                    this.translate_y = 0;

                    this.list_data.splice(0, 0, {"title":"本站代码","time":"2013-01-01 12:32:21","category":"javascript","id":"0","desc":"隐藏"})

                }, 1000);
            }
        }, false);
    },

    created() {
        // 初始化列表数据
        this.$store.dispatch('getList').then(() => {
            this.list_data = this.$store.state.list;
            this.page_total = Math.ceil(this.list_data.length / this.each);
        });

        // 滚动加载, 渲染
        var timer = null;
        window.onscroll = () => {
            // window.scrollY: 滚动条高度
            // window.screen.availHeight: 可视区高度
            // document.body.clientHeight: 文档高度
            if (window.screen.availHeight + window.scrollY + 50 >= document.body.clientHeight) {
                clearTimeout(timer);
                timer = setTimeout(() => {
                    if (this.page < this.page_total){
                        this.page++;
                    }
                }, 200);
            }
            // 如果无数据, 那么解除scroll绑定
            if (this.page >= this.page_total){
                window.onscroll = null;
                this.$store.commit('setListLoader', false);
            }
        }
    },

    methods: {
        _getScrollTop() {
            return window.pageYOffset;
        }
    },

    computed: {
        list_already_length() {
            // 已经显示的列表长度
            return this.page * this.each;
        }
    },

    components: {
        Loader
    }
}
</script>
<style scoped lang=scss>
.list-item {
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
                .title {
                    font-size: 0.18rem;
                    color: $font_color;
                    display: block;
                    letter-spacing: 1px;
                    font-weight: 100;
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
                    float: right;
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
