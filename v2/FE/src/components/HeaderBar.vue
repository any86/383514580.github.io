<template>
    <transition name="fade">
        <div class="com-header-bar" v-show="false">
            <div class="center">
                <img class="avator" src="../assets/avatar.png">
                <div class="search">
                    <input type="text">
                    <a class="btn">搜索</a>
                </div>
            </div>
        </div>
    </transition>
</template>
<script>
export default {
    name: 'HeaderBar'
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
    background: rgba(238, 238, 238, 0.3);
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
    .avator {
        float: left;
        height: $h;
        width: $h;
        display: block;
        float: left;
        margin-left: $h;
    }
    .search {
        float: right;
        margin-right: 0.15rem;
        height: $h;
        input {
            background: $color;
            width: 2rem;
            height: $h*0.8;
            line-height: $h;
            margin: $h*0.1 0.15rem 0 0;
            display: block;
            border-radius: 6px;
            padding: 0 0.1rem;
            font-size: 0.12rem;
            float: left;
        }
        .btn {
            float: left;
            display: block;
            cursor: pointer;
            &:hover {
                color: #ccc;
            }
        }
    }
}
</style>
