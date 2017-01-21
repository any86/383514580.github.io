<template>
    <div class="com-list"> 
        <!-- 列表 -->
        <transition-group :css="false" name="staggered-list" tag="ul" @before-enter="beforeEnter" @enter="enter">
            <li v-if="(each * page > i)" v-for="(row , i) in list_data_computed" :key="i" :data-index="i" class="list-item">
                <span class="category">[ {{row.category}} ]</span>
                <router-link class="title" :to="{ name: 'detail', params: { id: row.id }}" tag="h1">
                    {{row.title}}
                </router-link>
                <p class="time">{{row.create_time}}</p>
                <p class="desc" v-html="row.desc"></p>
                <router-link class="btn-view" :to="{ name: 'detail', params: { id: row.id }}" tag="a">查看全部</router-link>
            </li>
        </transition-group>
        
        <!-- info -->
        <p v-show="no_more" class="info">没有更多文章喽!</p>
    </div>
</template>

<script>
import Velocity from 'velocity-animate'

export default {
    name: 'List',

    props: ['page', 'no_more'],

    mounted() {
        // 初始化渲染, xhr
        this.$store.dispatch('getList').then(() => {
            // 获取所有列表数据
            this.list_data = this.$store.state.list;
            this.total = Math.ceil(this.list_data.length / this.each);
        });

    },

    computed: {
        list_data_computed(){
            if('' == this.$store.state.keyword) {
                return this.list_data;
            } else {
                return this.list_data.filter(item=>{
                    if(-1 < item.title.search(this.$store.state.keyword)){
                        return item;
                    }
                });
            }
        }
    },

    data() {
        return {
            total: 0,
            list_data: [],
            each: 3 // 每页数量
        };
    },

    watch: {
        page(){
            if(this.page >= this.total) {
                this.$emit('end');
            }
        }
    },

    methods: {
        beforeEnter(el) {
            el.style.webkitTransform = 'translateY(100px)';
            el.style.opacity = 0;
        },

        enter(el, done) {
            var index = el.dataset.index % this.each;
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
    }
}
</script>
<style scoped lang=scss>
.list-item {
    transition: all 1s;
    display: inline-block;
}


$font_color: #444;
.com-list {
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
    >.info {
        text-align: center;
        font-size: 0.14rem;
        color: #aaa;
        margin: 0.3rem auto;
    }
}
</style>
