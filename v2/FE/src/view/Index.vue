<template>
    <div class="index-view">
        <div class="foreground">
            <my-card></my-card>
            <scroll-list></scroll-list>
        </div>
        <float-bar></float-bar>
    </div>
</template>

<script>

import MyCard from '../components/MyCard'
import ScrollList from '../components/ScrollList'
import FloatBar from '../components/FloatBar'

export default {
  name: 'Index',
  components: {MyCard, ScrollList, FloatBar}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang=scss>
.foreground{
    width: 100%;
    overflow: hidden;
    position: relative;
    z-index: 1986;
}
</style>
