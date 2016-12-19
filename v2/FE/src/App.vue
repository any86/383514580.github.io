<template>
		<transition name="bounce" mode="out-in">
        <keep-alive>
  		    <router-view></router-view>
        </keep-alive>
  	</transition>
</template>

<script>
</script>

<style>

.bounce-enter-active {
  animation: bounce-in .5s;
}
.bounce-leave-active {
  animation: bounce-out .5s;
}
@keyframes bounce-in {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 1;
  }
}
@keyframes bounce-out {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>
