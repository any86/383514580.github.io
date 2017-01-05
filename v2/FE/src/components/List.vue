<template>
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
</template>
<script>
import Velocity from 'velocity-animate'

export default {
    name: 'List',
    data() {
        return {
            list_data: [],
            translate_y: 0,
            start_y: 0,
            start_scroll_top: 0,
            is_pull_down: false,
            is_loading: false
        };
    },

    mounted() {
    },

    created() {
        // 初始化列表数据
        this.$store.dispatch('getList').then(() => {
            this.list_data = this.$store.state.list;
            this.$store.commit('setPageTotal', Math.ceil(this.list_data.length / this.$store.state.page_each));
        });

        // 滚动加载, 渲染
        var timer = null;
        var _$store = this.$store;
        var _this = this;

        function isListPosTop(){
            // 计算list组件距离浏览器顶部距离
            // console.log(this.$el.getBoundingClientRect().top)
            if(0 >= _this.$el.getBoundingClientRect().top){
                _$store.commit('isListPosTop', true);
            } else {
                _$store.commit('isListPosTop', false);
            }
        }

        window.addEventListener('scroll', getList, false);
        window.addEventListener('scroll', isListPosTop, false);


        function getList(){
            // window.scrollY: 滚动条高度
            // window.screen.availHeight: 可视区高度
            // document.body.clientHeight: 文档高度
            if (window.screen.availHeight + window.scrollY + 50 >= document.body.clientHeight) {
                clearTimeout(timer);
                timer = setTimeout(() => {
                    if (_$store.state.page < _$store.state.page_total){
                        _$store.state.page++;
                        _$store.commit('setPage', _$store.state.page);
                    }
                }, 200);
            }

            // 如果无数据, 那么解除scroll绑定
            if (_$store.state.page >= _$store.state.page_total){
                window.removeEventListener('scroll', getList);
                _$store.commit('setListLoader', false);
            }
        }
    },

    methods: {
        beforeEnter(el){
            el.style.webkitTransform = 'translateY(100px)';
            el.style.opacity = 0;
        },

        enter(el, done){
            var index = el.dataset.index % this.$store.state.page_each;
            console.log(index)
            setTimeout(function(){
                Velocity(el,
                  { translateY: 0, opacity: 1},
                  { complete: done },
                  { duration: 1000 }
                )
            }, index * 300)
        },

        _getScrollTop() {
            return window.pageYOffset;
        },

        goDetail(id){
            // 记录当前滚动条位置
            this.$store.commit('setIndexPosY', window.scrollY);
            // goto
            this.$router.push({ name: 'detail',  params: { id: id }})
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
                .category{
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
                    height: 0.3rem;line-height: 0.3rem;
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
