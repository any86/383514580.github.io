<template>
    <transition  name="fade">
      <div class="com-header-bar" v-show="$store.state.top_bar.show">
        <div class="center">
          <!-- <p class="page-count">总计: {{$store.state.page_total}}</p> -->
          <p class="page-count">欢迎你哦!</p>

        </div>
      </div>
    </transition>
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
.fade-enter-active, .fade-leave-active {
  transition: all .5s
}
.fade-enter, .fade-leave-active {
  transform: translateY(-.5rem);
}

.com-header-bar{background: rgba(238,238,238,0.3);width: 100%;overflow: hidden;box-shadow: 1px 2px 5px rgba(0,0,0,0.1);position: fixed;top: 0;left: 0;z-index: 1986;
  
  >.center{max-width: 720px;margin:auto;overflow: hidden;padding: 0.05rem 0;height: 0.3rem;line-height: 0.3rem;width: 100%;
    
    >.page-count{text-align: center;width: 100%;}
  }
}
</style>
