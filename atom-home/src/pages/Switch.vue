<template>
    <article class="fill flex">
        <main class="flex-item">
            <h4>代码</h4>
            <pre class="is-radius ovh"><code class="fill  bg-lightest html language-html">
<div>123</div>
            </code></pre>
        </main>
        
        <iframe width="375" height="667" src="https://383514580.github.io/atom/#/switch"></iframe>"
    </article>
</template>

<script>
import highlight from 'highlight.js';
import 'highlight.js/styles/tomorrow.css';
export default {
    name: 'Install',

    data() {
        return {};
    },

    mounted() {
        // highlight.initHighlightingOnLoad();
        var block = document.querySelector('code');
        highlight.highlightBlock(block);
    }
};
</script>

<style scoped lang="scss">

</style>
