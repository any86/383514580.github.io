<template>
    <main class="container flex">
        <v-side/>
        <main class="flex-item">
            <router-view/>
        </main>
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
