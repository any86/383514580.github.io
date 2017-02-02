<template>
    <div class="com-scroll-view" @scroll="scrollView">
        <!-- 背景 -->
        <div class="background">
            <slot name="background"></slot>
        </div>

        <!-- 固定头部 -->
        <transition name="header-fixed">
            <div class="header-fixed" v-show="scrollTop > beforeContentHeight">
                <slot name="header-fixed"></slot>
            </div>
        </transition>

        <!-- 内容容器, 自适应高度 -->
        <div ref="body" class="body" :class="{'body-touch-end': 'end' == touch.is}" :style="{transform: 'translate3d(0, ' + translateY + 'px, 0)'}" @touchmove="touchMove" @touchstart="touchStart" @touchend="touchEnd">
            <!-- 主体前插槽-->
            <slot name="before-content"></slot>
            <!-- 主体 -->
            <slot name="content"></slot>
        </div>

        <!-- 默认插槽 -->
        <slot></slot>
        
        <!-- 固定底部 -->
        <transition name="bottom-fixed">
            <div class="bottom-fixed" v-show="0 < scrollTop">
                <slot name="bottom-fixed"></slot>
            </div>
        </transition>
    </div>
</template>

<script>
export default {
    name: 'ScrollView',

    props: ['pullable'],

    mounted() {
        if(!!this.$slots['before-content']) {
            this.beforeContentHeight = this.$slots['before-content'][0].elm.offsetHeight;
        }
    },

    data() {
        return {
            scrollTop: 0,
            beforeContentHeight: 0,
            timer: null,
            isEnd: false,
            touch: {
                startY: 0,
                endY: 0
            },
            translateY: 0
        };
    },

    methods: {
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

                // 手指滑动的距离
                var distance = this.touch.endY - this.touch.startY - this.$el.scrollTop;

                if (0 < distance) {
                    // 滑动减速, 太快体验不好
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

        scrollView() {

            if (!this.isEnd) {
                clearTimeout(this.timer);

                this.timer = setTimeout(() => {
                    this.$emit('scrolly', this.$el.scrollTop);

                    // 滚动条高度
                    var scrollTop = this.scrollTop = this.$el.scrollTop;
                    // 外壳高度
                    var warpHeight = this.$el.offsetHeight;
                    // 内容高度
                    var innerHeight = this.$refs.body.offsetHeight;
                    // 距离底部50px就触发
                    if (scrollTop + warpHeight + 50 > innerHeight) {
                        this.$emit('append');
                    }
                }, 100);
            }
        }
    }
}
</script>
<style scoped lang=scss>
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
    .header-fixed-enter-active, .header-fixed-leave-active {
      transition: all .5s
    }
    .header-fixed-enter, .header-fixed-leave-active {
      opacity: 0;
      transform: translateY(-.5rem);
    }
    
    >.body {
        overflow: hidden;
    }
    >.body-touch-end {
        transition: all .2s ease-in;
    }

    .bottom-fixed{position: fixed;bottom: 0;left: 0;width: 100%;}
    .bottom-fixed-enter-active, .bottom-fixed-leave-active {
      transition: all .5s
    }
    .bottom-fixed-enter, .bottom-fixed-leave-active {
      opacity: 0;
      transform: translateY(.5rem);
    }
}
</style>
