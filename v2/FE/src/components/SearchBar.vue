<template>
    <transition name="fade">
        <div class="com-header-bar">
            <div class="center">
                <div class="search">
                    <input  @keyup.enter="submit" v-model="keyword" type="text" placeholder="输入想搜啥">
                    <a @click="submit" class="btn">搜索</a>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
export default {
    name: 'SearchBar',

    data(){
        return {keyword: ''};
    },

    methods: {
        submit(){
            // 改成路由传值
            this.$store.commit('setKeyword', this.keyword);
        }
    }
}
</script>
<style lang=scss scoped>
.fade-enter-active,
.fade-leave-active {
    transition: all .5s
}

.fade-enter,
.fade-leave-active {
    transform: translateY(-.5rem);
}

.com-header-bar {
    background: rgba(238,238,238,.3);
    width: 100%;
    overflow: hidden;
    box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1986;
    >.center {
        max-width: 720px;
        margin: auto;
        overflow: hidden;
        padding: 0.05rem 0;
        height: 0.3rem;
        line-height: 0.3rem;
        width: 100%;
    }
    $h: .3rem;
    $color: rgba(204, 204, 204, .38);
    .search {
        height: $h;
        width: 100%;
        box-sizing:border-box;
        display: -webkit-box;
        padding-left: .15rem;

        >input {
            -webkit-box-flex:1;
            background: $color;
            height: $h*0.8;
            line-height: $h*0.8;
            margin: $h*0.1 0.15rem 0 0;
            display: block;
            border-radius: 6px;
            padding: 0 0.1rem;
            font-size: 0.12rem;
            color:#444;
        }
        
        >.btn {
            width: .6rem;
            text-align: center;
            display: block;
            cursor: pointer;
            &:hover {
                color: #ccc;
            }
        }
    }
}
</style>
