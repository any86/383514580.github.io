<template>
    <ul class="com-float-bar">
        <li @click="scrollTop">顶部</li>
    </ul>
</template>
<script>
export default {
    name: 'FloatBar',

    methods: {
        scrollTop() {
            // 递归函数
            if (0 < this.$parent.$el.scrollTop) {
                this.$parent.$el.scrollTop-= this.$parent.$el.scrollTop / 10;
                window.requestAnimationFrame(this.scrollTop);
            }
        }
    }
}
</script>
<style lang=scss scoped>
$btn_width: 0.5rem;
.com-float-bar {
    position: fixed;
    z-index: 1986;
    bottom: 0.2rem;
    right: 0.2rem;
    display: block;
    >li {
        line-height: $btn_width;
        height: $btn_width;
        width: $btn_width;
        text-align: center;
        background: rgba(0, 0, 0, 0.6);
        display: block;
        font-size: 0.14rem;
        border-radius: $btn_width;
        color: #fff;
        cursor: pointer;
        box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.3);
        transition: all 1s;
        &:active {
            background: rgba(0, 0, 0, 0.5);
            box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.3) inset;
        }
    }
}
</style>
