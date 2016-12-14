<template>
    <div class="com-list">
        <!--         <div class="list-count">
            <p class="text">共{{count}}篇</p>
        </div>     -->
        <div class="scroll-container">
            <!-- list -->
            <transition-group class="list-row" name="list" tag="ul">
                <li v-if="(list_view_length > i)" v-for="(row, i) in list_data" :key="row.id" class="list-item">
                    <router-link class="title" :to="{ name: 'detail', params: { id: row.id }}" tag="h1">
                        {{row.title}}
                    </router-link>
                    <p class="desc" v-html="'[' + row.category + ']' + row.desc"></p>
                    <p class="time">{{row.create_time}}</p>
                    <router-link class="btn-view" :to="{ name: 'detail', params: { id: row.id }}" tag="a">查看全部</router-link>
                </li>
            </transition-group>
            <!-- loader -->
            <loader v-if="$store.state.list_loader"></loader>
            <!-- info -->
            <p class="list-info" v-else>没有更多文章喽!</p>
            
        </div>
    </div>
</template>
<script>
import Loader from './Loader'
export default {
    name: 'list',
    data(){
        return {page: 1, each: 3, loading: true, list_data: [], list_data_length: 0};
    },
    created() {
        // 初始化列表数据
        this.$store.dispatch('getList').then(() => {
            this.list_data = this.$store.state.list;
            this.list_data_length = this.$store.state.list.length;
        });
        // 滚动加载, 渲染
        var timer = null;
        window.onscroll = () => {
            // window.scrollY: 滚动条高度
            // window.screen.availHeight: 可视区高度
            // document.body.clientHeight: 文档高度
            if (window.screen.availHeight + window.scrollY + 50 >= document.body.clientHeight) {
                clearTimeout(timer);
                timer = setTimeout(() => {
                    this.page++;
                }, 200);
            }
            // 如果无数据, 那么解除scroll绑定
            if(this.list_view_length >= this.list_data_length) {
                window.onscroll = null;
                this.$store.commit('setListLoader', false);
            }
        }
    },
    computed: {
        list_view_length(){
            // 已经显示的列表长度
            return this.page * this.each;
        }
    },
    components: {Loader}
}
</script>
<style scoped lang=scss>
.list-item { display: inline-block; }
.list-enter-active, .list-leave-active { transition: all 1s; }
.list-enter, .list-leave-active { opacity: 0; transform: translateY(-30px); }
$font_color: #444;

.com-list { 
    .scroll-container { 
        .list-row { max-width: 720px; margin: 0.15rem auto; display: block;
            li { padding: 0.15rem; display: block; overflow: hidden; margin-top: 0.45rem;
                p, a { font-size: 0.14rem; }
                a:visited { text-decoration: none; outline: none; border: none; }
                .title { font-size: 0.18rem; color: $font_color; display: block; letter-spacing: 1px; font-weight: 100; cursor: pointer; }
                .desc { margin-top: 0.15rem; letter-spacing: 0.01rem; color: $font_color; display: block; line-height: 1.5; letter-spacing: 1px; }
                .time { display: block; color: $font_color; letter-spacing: 1px; float: right; }
                .btn-view { padding: 0.05rem; margin-top: 0.3rem; width: 0.7rem; background: #999; color: #fff; clear: both; cursor: pointer; display: block; text-align: center; border-radius: 4px; box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1); }
            }
        }

        .list-count { p.text { font-size: 0.16rem; text-align: center; padding-top: 0.15rem; }
        }
        .list-info{text-align: center;font-size: 0.14rem;color: #aaa;margin: 0.3rem auto;}
    }
}
</style>
