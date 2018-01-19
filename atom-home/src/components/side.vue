<template>
     <aside>
        <h1 class="fill text-center border-bottom">Atom-UI</h1>
        <div class="menu">
            <h3 class="fill">快速开始</h3>
            <p @click="$router.push({path: '/install'})" class="fill">安装</p>
            <p class="fill" >配置</p>
            <p class="fill">快速上手</p>

            <h3 class="fill gutter-top">组件</h3>
            <h5 class="fill text-light">表单</h5>
            <p class="fill" >Switch</p>
            <p class="fill">Radio</p>
            <p class="fill">Checkbox</p>
            <p class="fill">Count</p>
            <p class="fill">Input</p>
            <p class="fill">Textarea</p>
            <p class="fill">Button</p>
            <p class="fill">ButtonGroup</p>
            <p class="fill">Range</p>
            <p class="fill">Rate</p>
            <p class="fill">Picker</p>



            
        </div>
    </aside>
</template>

<script>
export default {
    name: 'side',

    mounted() {}
};
</script>

<style scope lang="scss">
@import '../scss/global.scss';
aside {
    height: 100vh;
    width: 280px;
    overflow-x: hidden;
    overflow-y: auto;
    box-shadow: 1px 0 3px rgba(0, 0, 0, 0.1);
    .menu {
        p{
            &:hover{color:$primary;}
        }
    }
}
</style>
