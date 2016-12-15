<template>
    <div class="index-view">
        <div class="foreground">
            <!-- <my-card></my-card> -->
            <list></list>
        </div>
        <float-bar></float-bar>
    </div>
</template>

<script>

import MyCard from '../components/MyCard'
import List from '../components/List'
import FloatBar from '../components/FloatBar'

export default {
  name: 'Index',
  components: {MyCard, List, FloatBar}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.foreground{
    width: 100%;
    overflow: hidden;
    position: relative;
    z-index: 1986;
}
</style>
