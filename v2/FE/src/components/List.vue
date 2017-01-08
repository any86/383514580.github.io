<template>
    <!-- 列表 -->
    <transition-group :css="false" name="staggered-list" class="list" tag="ul" @before-enter="beforeEnter" @enter="enter">
        <li v-if="(page_each * page_active > i)" v-for="(row, i) in list_data" :key="i" :data-index="i" class="list-item">
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
            list_data: [], // 列表数据
            page_active: 1,
            page_length: 0, // 总页数
            page_each: 3 // 每页数量
        };
    },

    mounted() {
        // 初始化渲染, xhr
        this.$store.dispatch('getList').then(() => {
            // 获取所有列表数据
            this.list_data = this.$store.state.list;
            // 计算总页数
            this.page_length = Math.ceil(this.list_data.length / this.page_each);
        });

        // 总数
        this.page_length = this.list_data.length;
    },

    methods: {
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
