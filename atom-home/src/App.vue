<template>
    <main class="container flex">
        <v-side/>
        <router-view/>
    </main>
</template>

<script>
import VSide from '@/components/side.vue';
export default {
    name: 'app',

    components: { VSide }
};
</script>

<style lang="scss">
@import './scss/global.scss';
</style>
