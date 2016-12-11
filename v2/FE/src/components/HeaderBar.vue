<template>
    <div class="com-header">
      <div class="center">
        <router-link class="btn-return" :to="{ name: 'index'}" tag="a">主页</router-link>
        <h1 class="say">hi! 程序能干的事, 别用人力.</h1>
      </div>
    </div>
</template>

<script>
export default {
  name: 'HeaderBar',
  computed: {

  },
  methods: {

  }
}
</script>

<style lang=scss scoped>
$btn_height: 0.3rem;
.com-header{background: #eee;width: 100%;overflow: hidden;box-shadow: 1px 2px 5px rgba(0,0,0,0.1);
  .center{max-width: 720px;margin:auto;overflow: hidden;padding: 0.05rem 0;
    .btn-return{line-height: $btn_height; height: $btn_height;width: 0.6rem;text-align: center; background: #aaa;display: block;font-size: 0.14rem;border-radius: 4px;color: #fff;cursor: pointer;float: left;box-shadow:1px 2px 5px rgba(0,0,0,0.3);transition:all .5s;
      &:hover{box-shadow:1px 2px 5px rgba(0,0,0,0.1);background: #ccc;}
      &:active{box-shadow:1px 2px 5px rgba(0,0,0,0.1);background: #ccc;}
    }

    .say{float: left; font-size: 0.16rem; color: rgba(0, 0, 0, 0.61);font-weight: 100;line-height: $btn_height;margin-left: 0.3rem;}    
  }

}
</style>
