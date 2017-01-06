<template>
    <div class="index-view">
        <div class="foreground">
            <my-card></my-card>
            <header-bar>
              <img class="avator" src="../assets/avatar.png">
              <div class="search">
                <input type="text">
                <a class="btn">搜索</a>
              </div>
            </header-bar>
            <scroll-list></scroll-list>
        </div>
        <float-bar></float-bar>
    </div>
</template>

<script>

import HeaderBar from '../components/HeaderBar'
import MyCard from '../components/MyCard'
import ScrollList from '../components/ScrollList'
import FloatBar from '../components/FloatBar'

export default {
  name: 'Index',
  components: {HeaderBar, MyCard, ScrollList, FloatBar},
  activated(){
    window.scrollTo(0, this.$store.state.index_pos_y);
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang=scss>
.index-view{
  >.foreground{
      position: relative;
      width: 100%;
      overflow: hidden;
      z-index: 1986;}
      $h: .3rem;
      $color: rgba(204,204,204,.38);
      .avator{float: left;height: $h;width: $h;display: block; float: left;margin-left: $h;}
      .search{float: right;margin-right: 0.15rem;height: $h;
        input{background: $color;width: 2rem; height: $h*0.8;line-height: $h; margin:$h*0.1 0.15rem 0 0;display: block;border-radius:6px;padding: 0 0.1rem;font-size: 0.12rem;float: left;}
        .btn{float: left;display: block;cursor: pointer;
          &:hover{color:#ccc;}
        }
      }
}
</style>
