<template>
    <div class="detail-view">
        <loader v-show="$store.state.detail_loader"></loader>  
        <header-bar v-show="!$store.state.detail_loader"></header-bar> 
        <section v-show="!$store.state.detail_loader">
            <header>
                <p class="email">Email: <a href="mailto:383514580@qq.com">383514580@qq.com</a></p>
                <h1 class="title">{{detail.title}}</h1>
                <p class="time">发布: {{detail.create_time}}</p>
                <!-- <router-link class="btn-return" :to="{ name: 'index'}" tag="a">返回</router-link> -->
            </header>
            <article v-html="detail.desc"></article>            
        </section>
    </div>
</template>
<script>
import Loader from '../components/Loader'
import HeaderBar from '../components/HeaderBar'

export default {
    name: 'Detail',
    created() {
        // 初始化detail页的loader
        this.$store.commit('setDetailLoader', true);
        this.$store.dispatch('getDetail', this.$route.params.id);
        window.onscroll = null;
    },
    computed: {
        detail() {
            return this.$store.state.detail;
        }
    },
    components: {
        Loader, HeaderBar
    }
}
</script>
<style scoped lang=scss>
.detail-view {

    /*头部*/
    header { overflow: hidden; font-size: 0.14rem; color: #444; max-width: 720px; padding: 0.15rem; margin: 0.15rem auto 0;
        .email a { color: #444; text-decoration: underline; }
        .title { font-size: 0.28rem; letter-spacing: 2px; margin: 0.15rem 0;font-weight: 100;}
        .btn-return { float: right; padding: 0.05rem 0.15rem; background: #ccc; color: #fff; border-radius: 4px; }
    }

    /*正文*/
    article { color: #444; max-width: 720px; padding: 0.15rem; margin: auto;line-height: 30px; letter-spacing: 2px; font-size: 0.15rem;}
}
</style>
