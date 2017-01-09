<template>
    <scroll-view></scroll-view>
</template>

<script>
import ScrollView from '../components/ScrollView'


export default {
    name: 'Index',

    components: {
        ScrollView
    },

    activated() {
        window.scrollTo(0, this.$store.state.index_pos_y);
    }
}
</script>

<style scoped lang=scss>

</style>
