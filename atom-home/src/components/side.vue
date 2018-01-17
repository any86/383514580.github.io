<template>
    <aside >
        <h1 class="fill text-center border-bottom">Atom-UI</h1>
        <a-collapse :is-accordion="true">
            <a-collapse-item title="快速开始">
                <a-cell @click="$router.push({path: '/install'})">安装</a-cell>
                <a-cell>配置</a-cell>
                <a-cell>快速上手</a-cell>
            </a-collapse-item>


            <a-collapse-item title="表单">
                <a-cell>Switch</a-cell>
                <a-cell>Radio</a-cell>
            </a-collapse-item>

            <a-collapse-item title="对话框">
                <a-cell>Alert</a-cell>
                <a-cell>Confirm</a-cell>
            </a-collapse-item>
        </a-collapse>
    </aside>
</template>

<script>
export default {
    name: 'side',

    mounted() {}
};
</script>

<style scope lang="scss">
aside {
    height: 100vh;
    width: 280px;
    box-shadow: 1px 0 3px rgba(0,0,0,0.1);
    .menu {
        &__item {
        }
    }
}
</style>
