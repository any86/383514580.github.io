<template>
    <div class="com-scroll-view">
        <!-- 内容容器, 自适应高度 -->
        <div class="body">
            <!-- 名片 -->
            <my-card></my-card>
            
            <!-- 浮动按钮 -->
            <float-bar></float-bar>
            
            <!-- 头部条 -->
            <header-bar :pos="scroll_top"></header-bar>
            
            <!-- 列表 -->
            <list :page="view_page" @end="endScroll" :pos="scroll_top" @peak="showHeadBar"></list>    

            <!-- loader -->
            <loader class="down_loader" :opts="{show: !is_end}"></loader>

            <!-- info -->
            <p v-show="is_end" class="info">没有更多文章喽!</p>
        </div>
    </div>
</template>

<script>
import HeaderBar from './HeaderBar'
import MyCard from './MyCard'
import FloatBar from './FloatBar'
import List from './List'
import Loader from './Loader'

export default {
    name: 'ScrollView',

    data() {
        return {
            scroll_top: 0,
            view_page: 1,
            timer: null,
            is_end: false
        };
    },

    mounted() {
        // 绑定滚动
        this.$el.addEventListener('scroll', this.scrollList, false);

        // 滚动到记忆位置
        this.$el.scrollTop = this.scroll_top;
    },

    methods: {
        showHeadBar(){

        },
        
        endScroll(){
            // 加载完全部数据, 解除绑定
            this.$el.removeEventListener('scroll', this.scrollList, false);
            this.is_end = true;
        },

        scrollList() {
            // 同步scroll_top
            this.scroll_top = this.$el.scrollTop;

            clearTimeout(this.timer);

            this.timer = setTimeout(() => {
                // 滚动条高度
                var scroll_top = this.$el.scrollTop;
                // 外壳高度
                var warp_height = this.$el.offsetHeight;
                // 内容高度
                var inner_height = this.$el.childNodes[0].offsetHeight;

                if (scroll_top + warp_height + 50 > inner_height) {
                    this.view_page++;
                }
            }, 200);
        }
    },

    components: {
        HeaderBar,
        MyCard,
        FloatBar,
        Loader, 
        List
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
.com-scroll-view {
    height: 100%;
    width: 100%;
    overflow: scroll;

    >.body {
        overflow: hidden;

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

        >.down_loader {
            margin: 0.15rem auto;
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
