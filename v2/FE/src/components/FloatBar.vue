<template>
    <transition>
        <ul class="com-floatbar">
            <li @click="goTop">顶部</li>
        </ul>
    </transition>
</template>
<script>
export default {
    name: 'FloatBar',

    methods: {
        goTop(){
            this.$emit('click');
        }
    }
}
</script>

<style lang=scss scoped>
.v-enter{
    opacity: 0;
    transform: translateY(1rem);

}
.v-enter-active{
    transition: all .5s;

}
.v-leave{

}
.v-leave-active{
    opacity: 0;
    transform: translateY(1rem);    
    transition: all .5s;
}

$btn_width: 0.5rem;
.com-floatbar {
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
