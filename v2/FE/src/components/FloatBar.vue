<template>
    <ul class="com-float-bar">
      <li>返回</li>
    </ul>
</template>

<script>
export default {
  name: 'FloatBar',
  computed: {

  },
  methods: {

  }
}
</script>

<style lang=scss scoped>
$btn_width: 0.5rem;

.com-float-bar{position: fixed;z-index: 1986;bottom: 0.5rem;right: 0.5rem;display: block;
  li{line-height: $btn_width; height: $btn_width;width: $btn_width;text-align: center; background: rgba(0,0,0,0.6);display: block;font-size: 0.14rem;border-radius: $btn_width;color: #fff;cursor: pointer;box-shadow:1px 2px 5px rgba(0,0,0,0.3);transition:all .5s;
	&:hover{background:#ccc;box-shadow:1px 2px 5px rgba(0,0,0,0.1) inset;}
  }
}
</style>
