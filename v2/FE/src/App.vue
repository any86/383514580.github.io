<template>
	<transition name="fade" mode="out-in">
        <keep-alive>
  		    <router-view></router-view>
        </keep-alive>
  	</transition>
</template>

<script>
</script>

<style scoped lang=scss>
.fade-enter-active,
.fade-leave-active {
    opacity: 1;
    transition: all .5s;
}

.fade-enter,
.fade-leave-active {
    opacity: 0;
    transform: translateY(-.5rem);
}
</style>
