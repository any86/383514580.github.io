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
            // 内部函数
            function scrollTop() {
                var scroll_top = document.documentElement.style.scrollTop || document.body.scrollTop;
                if (0 < scroll_top) {
                    scroll_top -= document.body.clientHeight / 1000 * 17;
                    window.scrollTo(0, scroll_top);
                    window.requestAnimationFrame(scrollTop);
                }
            }
            scrollTop();
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
