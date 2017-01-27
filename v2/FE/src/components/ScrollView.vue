<template>
    <div class="com-scroll-view" @scroll="scrollList">
        <!-- 背景 -->
        <div class="background">
            <slot name="background"></slot>
        </div>

        <!-- 固定头部 -->
        <transition name="header-fixed">
            <div class="header-fixed" v-show="scrollTop > bannerHeight">
                <slot name="header-fixed"></slot>
            </div>
        </transition>

        <!-- 内容容器, 自适应高度 -->
        <div ref="body" class="body" :class="{'body-touch-end': 'end' == touch.is}" :style="{transform: 'translate3d(0, ' + translateY + 'px, 0)'}" @touchmove="touchMove" @touchstart="touchStart" @touchend="touchEnd">
            <!-- 头图等 -->
            <slot name="banner"></slot>
            <!-- 主体 -->
            <slot name="content"></slot>
        </div>

        <!-- 尾部 -->
        <slot name="footer-fixed"></slot>
    </div>
</template>
<script>
export default {
    name: 'ScrollView',

    props: ['scrollTop', 'pullable'],

    mounted() {
        if(!!this.$slots.banner) {
            this.bannerHeight = this.$slots.banner[0].elm.offsetHeight;
        }
    },

    data() {
        return {
            bannerHeight: 0,
            timer: null,
            isEnd: false,
            touch: {
                startY: 0,
                endY: 0
            },
            translateY: 0
        };
    },

    watch: {
        scrollTop(newValue) {
            this.animateScrollTop(newValue);
        }
    },

    methods: {

        animateScrollTop(value) {
            // 递归函数
            if (value < this.$el.scrollTop) {
                this.$el.scrollTop-= this.scrollTop / 10;
                window.requestAnimationFrame(this.animateScrollTop);
            }
        },

        touchStart(e) {
            if (this.pullable) {
                this.touch.is = 'start';
                this.touch.startY = e.touches[0].clientY;
                this.$emit('touchstart');
            }
        },

        touchMove(e) {
            if (this.pullable) {
                this.touch.is = 'move';
                this.touch.endY = e.touches[0].clientY;
                var distance = this.touch.endY - this.touch.startY - this.scrollTop;
                if (0 < distance) {
                    this.translateY = distance / 2;
                    e.preventDefault();
                    e.stopPropagation();
                    this.$emit('touchmove');
                }
            }
        },

        touchEnd(e) {
            if (this.pullable) {
                this.touch.is = 'end';
                this.translateY = 0;
                this.$emit('touchend');
            }
        },

        scrollList() {

            if (!this.isEnd) {
                clearTimeout(this.timer);

                this.timer = setTimeout(() => {
                    this.$emit('scrolly', this.$el.scrollTop);

                    // 滚动条高度
                    var scrollTop = this.$el.scrollTop;
                    // 外壳高度
                    var warpHeight = this.$el.offsetHeight;
                    // 内容高度
                    var innerHeight = this.$refs.body.offsetHeight;
                    if (scrollTop + warpHeight + 50 > innerHeight) {
                        this.$emit('append');
                    }
                }, 120);
            }
        }
    }
}
</script>
<style scoped lang=scss>
.header-fixed-enter-active, .header-fixed-leave-active {
  transition: all .5s
}
.header-fixed-enter, .header-fixed-leave-active {
  opacity: 0;
  transform: translateY(-.5rem);
}


$font_color: #444;
.com-scroll-view {
    position: relative;
    height: 100%;
    width: 100%;
    overflow: scroll;
    >.background {
        width: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }
    >.header-fixed {
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1986;
    }
    >.body {
        overflow: hidden;
    }
    >.body-touch-end {
        transition: all .2s ease-in;
    }
}
</style>
