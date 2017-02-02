<template>
	<transition appear mode="out-in">
        <keep-alive>
  		    <router-view></router-view>
        </keep-alive>
  	</transition>
</template>

<script>
</script>

<style scoped lang=scss>
.v-enter{
    opacity: 0;
    transform: translateY(-.5rem);	
}

.v-enter-active {
    transition: all .5s;
}

.v-leave-active {
    opacity: 0;
    transition: all .5s;
    transform: translateY(-.5rem);
}
</style>
