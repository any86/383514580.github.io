<template>
	<transition mode="out-in">
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
    opacity: 1;
    transition: all .5s;
    transform: translateY(0);
}


.v-leave {
    opacity: 1;
    transform: translateY(0);
}

.v-leave-active {
    opacity: 0;
    transition: all .5s;
    transform: translateY(-.5rem);
}

</style>
