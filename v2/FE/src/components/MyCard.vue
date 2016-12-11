<template>
    <div class="com-card">
        <h1 class="name">宁宁</h1>
        <div class="avatar">
            <img src="../assets/avatar.png">
        </div>
        <h1 class="say">hi! 程序能干的事, 别用人力.</h1>
    </div>
</template>

<script>
export default {
  name: 'MyCard',
  computed: {

  },
  methods: {

  }
}
</script>

<style lang=scss scoped>
@mixin textCenter($size: 0.14rem, $color: rgba(0, 0, 0, 0.61)) {
    text-align: center;
    font-size: $size;
    color: $color;
    font-weight: 100;
}

.com-card{
    background-color: #eee; padding: 0.15rem;box-shadow: 1px 2px 50px rgba(#444, 0.1);border-radius: 0 0 0 0;
    .name{ @include textCenter(0.24rem);margin-top: 0.15rem;letter-spacing: 2px;}
    .avatar{width: 1.2rem; height: 1.2rem;margin: 0.15rem auto;
        img{display: block;width: 100%;}
    }
    .say{ @include textCenter(0.18rem);margin: 0.3rem auto 0.15rem; letter-spacing: 2px;}
}
</style>
