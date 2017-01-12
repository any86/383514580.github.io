<template>
    <scroll-view @scrolly="scrollyChange" :scroll_top="scroll_top">
        <!-- 浮动工具 -->
        <float-bar v-show="0 < scroll_top"></float-bar>
        
        <!-- loader -->
        <loader :opts="{show: loader_show}"></loader>
        
        <!-- 内容 -->
        <section v-show="!$store.state.detail_loader">
            <header>
                <router-link class="btn-return" :to="{ name: 'index'}" tag="a">返回</router-link>
                <p class="email">Email: <a href="mailto:383514580@qq.com">383514580@qq.com</a></p>
            </header>
            <article class="article" v-html="detail"></article>            
        </section>

    </scroll-view>
</template>

<script>
import ScrollView from '../components/ScrollView'
import Loader from '../components/Loader'
import SearchBar from '../components/SearchBar'
import FloatBar from '../components/FloatBar'

export default {
    name: 'Detail',

    data(){
        return {scroll_top: 0, loader_show: true};
    },

    methods: {
        scrollyChange(top){
            this.scroll_top = top;
        }
    },

    activated() {
        // 获取数据
        this.$store.dispatch('getDetail', this.$route.params.id).then(() => {
            this.list_data = this.$store.state.list;
            this.loader_show = false;
        });
    },

    computed: {
        detail() {
            return this.$store.state.detail;
        }
    },

    components: {
        ScrollView,
        Loader, 
        SearchBar, 
        FloatBar
    }
}
</script>
<style scoped lang=scss>
    header { overflow: hidden; font-size: 0.14rem; color: #444; max-width: 720px; padding: 0.15rem; margin: 0.15rem auto 0;
        >.btn-return { float: left; padding: 0.05rem 0.15rem; background: #ccc; color: #fff; border-radius: 4px; letter-spacing: 2px;}
        >.email{float: right;
             a {color: #444; text-decoration: underline; }
        }

    }

    article{max-width: 720px; padding: 0.15rem; margin: auto; letter-spacing: 2px;line-height: 1.5;font-size: 0.15rem;
        
        em{font-style: normal;font-weight: 600;text-decoration: underline;}
        p{margin-top: 0.15rem;}

        h1{font-size: 0.24rem;margin-bottom: 0.15rem;
            +p{font-size: 0.12rem;font-weight: 100;color: #555;}
        }
        
        h2{margin:0.3rem 0 0.05rem 0;}
        h3{margin:0.15rem 0 0.05rem 0;}
        
        pre{padding: 0.1rem;border:1px dashed #ccc;}

    }
</style>
