<template>
    <aside>
        <ul class="menu">
            <li class="menu__item" v-for="n in 10" :key="n">
                {{n}}
            </li>
        </ul>
    </aside>
</template>

<script>
export default {
    name: 'side'
};
</script>

<style scope lang="scss">
.menu{
    &__item{

    }
}
</style>
