<template>
    <div class="loader">
        <img src="../assets/three-dots.svg">
        <p align="center">努力加载...</p>
    </div>
</template>
<script>
export default {
    name: 'loader'
}
</script>
<style scoped lang=scss>
.loader {
    margin: 0.6rem auto;
    img {
        display: block;
        width: 0.8rem;
        margin: 0.3rem auto 0.1rem;
    }
    p {
        font-size: 0.14rem;
        color: #ccc;
    }
}
</style>
