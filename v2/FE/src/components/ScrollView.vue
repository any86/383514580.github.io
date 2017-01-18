<template>
    <div class="com-scroll-view" @scroll="scrollList">
        <div class="bg">
            <slot name="bg"></slot>  
        </div>
        <!-- 内容容器, 自适应高度 -->
        <div class="body" :class="{'touch-end': 'end' == touch.is}" :style="{transform: 'translate3d(0, ' + translate_y + 'px, 0)'}" @touchmove="touchMove" @touchstart="touchStart" @touchend="touchEnd">
            <slot></slot>
        </div>
        <slot name="not_in_body"></slot>        
    </div>
</template>

<script>

export default {
    name: 'ScrollView',

    props: ['scroll_top'],

    data() {
        return {
            timer: null,
            is_end: false,
            touch: {
                start_y: 0,
                end_y: 0
            },
            translate_y: 0
        };
    },

    mounted() {
        // 滚动到记忆位置
        // this.$el.scrollTop = this.scroll_top;
    },

    watch: {
        scroll_top(){
            this.$el.scrollTop = this.scroll_top;
        }
    },

    computed: {
        distance(){
            return this.touch.end_y - this.touch.start_y - this.scroll_top;
        }
    },

    methods: {
        touchStart(e){
            this.touch.is = 'start';
            this.touch.start_y = e.touches[0].clientY;
            this.$emit('touchstart');
        },

        touchMove(e){
            this.touch.is = 'move';
            this.touch.end_y = e.touches[0].clientY;
            var distance = this.touch.end_y - this.touch.start_y - this.scroll_top;
            if(0 < distance) {
                this.translate_y = distance / 2;
                e.preventDefault();
                e.stopPropagation();
                this.$emit('touchmove');
            }
        },

        touchEnd(e){
            this.touch.is = 'end';
            this.translate_y = 0;
            this.$emit('touchend');
        },

        scrollList() {
            this.$emit('scrolly', this.$el.scrollTop);

            if(!this.is_end) {
                clearTimeout(this.timer);

                this.timer = setTimeout(() => {
                    // 滚动条高度
                    var scroll_top = this.$el.scrollTop;
                    // 外壳高度
                    var warp_height = this.$el.offsetHeight;
                    // 内容高度
                    var inner_height = this.$el.childNodes[0].offsetHeight;

                    if (scroll_top + warp_height + 50 > inner_height) {
                        this.$emit('append');
                    }
                }, 200);
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
