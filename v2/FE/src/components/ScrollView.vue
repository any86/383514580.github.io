<template>
    <div class="com-scroll-view" @scroll="scrollList">
        <!-- 背景 -->
        <div class="bg">
            <slot name="bg"></slot>  
        </div>
        
        <!-- 头部 -->
        <slot name="header-fixed"></slot>

        <!-- 内容容器, 自适应高度 -->
        <div 
            ref="body" 
            class="body" 
            :class="{'touch-end': 'end' == touch.is}" 
            :style="{transform: 'translate3d(0, ' + translateY + 'px, 0)'}" 
            @touchmove="touchMove" 
            @touchstart="touchStart" 
            @touchend="touchEnd">

            <!-- 头图等[可选] -->
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

    data() {
        return {
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
        scrollTop(){
            this.$el.scrollTop = this.scrollTop;
        }
    },

    methods: {
        touchStart(e){
            if(this.pullable) {
                this.touch.is = 'start';
                this.touch.startY = e.touches[0].clientY;
                this.$emit('touchstart');                
            }
        },

        touchMove(e){
            if(this.pullable) {
                this.touch.is = 'move';
                this.touch.endY = e.touches[0].clientY;
                var distance = this.touch.endY - this.touch.startY - this.scrollTop;
                if(0 < distance) {
                    this.translateY = distance / 2;
                    e.preventDefault();
                    e.stopPropagation();
                    this.$emit('touchmove');
                }
            }
        },

        touchEnd(e){
            if(this.pullable) {
                this.touch.is = 'end';
                this.translateY = 0;
                this.$emit('touchend');
            }
        },

        scrollList() {

            if(!this.isEnd) {
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

.touch-end {
    transition: all .2s ease-in;
}


$font_color: #444;
.com-scroll-view {
    position: relative;
    height: 100%;
    width: 100%;
    overflow: scroll;
    
    .bg{    
        width: 100%;
        position: absolute;
        top:0;left:0;
    }

    >.body {
        overflow: hidden;
    }
}
</style>
