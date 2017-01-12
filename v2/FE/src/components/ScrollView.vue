<template>
    <div class="com-scroll-view" @scroll="scrollList">
        <!-- 内容容器, 自适应高度 -->
        <div class="body">
            <slot></slot>
        </div>
    </div>
</template>

<script>

export default {
    name: 'ScrollView',

    props: ['is_end', 'scroll_top'],

    data() {
        return {
            timer: null
        };
    },

    mounted() {
        // 滚动到记忆位置
        this.$el.scrollTop = this.scroll_top;
    },

    methods: {
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
    }
}
</style>
