<template>
    <div class="ball-stage">
        <div style="left: 4rem;top:3rm;width: 1rem;height: 1rem;" class="u-ball"></div>
        <div style="left: 1rem;top:5rem;width: 3rem;height: 3rem;" class="u-ball"></div>
        <div style="right: 0;top:1rem;width: 2rem;height: 2rem;" class="u-ball"></div>
    </div>
</template>

<script>
export default {
  name: 'mycard'
}
</script>

<style lang=scss scoped>
@mixin textCenter() {
    text-align: center;
}
.m-card{
    .name{ @include textCenter;}
    .work{ @include textCenter;}
    .avatar{display: block;width: 50%;margin: auto;}
}
</style>
