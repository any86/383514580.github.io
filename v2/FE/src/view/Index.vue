<template>

    <scroll-view 
        :pullable="true" 
        :scrollTop="scrollTop"  
        @touchstart="touchStart" 
        @touchend="touchEnd" 
        @append="addPage">

        <!-- 背景 -->
        <!-- slot: background -->
        <spinner slot="background" class="down_spinner">{{top_spinner_text}}</spinner>
        
        <!-- 名片 -->
        <!-- slot: banner -->
        <my-card slot="banner"></my-card>
        
        <!-- 搜索 -->
        <!-- slot:header-fixed -->
        <search-bar slot="header-fixed"></search-bar>
        
        <!-- slot: content -->
        <template slot="content">
        <button @click="click">确定</button>
            <!-- 列表 -->
            <list 
                v-if="null != list_length" 
                :length="list_length" 
                :list="list_data" 
                :each="3" 
                :keyword="$route.query.keyword" 
                :page="viewPage" 
                @end="no_more = true">
            </list>    

            <!-- spinner -->
            <spinner class="down_spinner" v-show="!no_more"></spinner>
        </template>

        <!-- 浮动按钮 -->
        <!-- slot: footer-fixed -->
        <float-bar slot="footer-fixed" v-show="0 < scrollTop"></float-bar>

    </scroll-view>
</template>

<script>
import ScrollView from '../components/ScrollView'
import SearchBar from '../components/SearchBar'
import MyCard from '../components/MyCard'
import FloatBar from '../components/FloatBar'
import List from '../components/List'
import Spinner from '../components/Spinner'

export default {
    name: 'Index',

    mounted(){
        this.$store.dispatch('getList').then(() => {
            // 获取所有列表数据
            this.list_data = this.$store.state.list;
            this.list_length = this.list_data.length;
        });
    },

    data(){
    	return {
            list_data: [],
            list_length: null,
    		scrollTop: 0,
            viewPage: 1,
            no_more: false,
            top_spinner_text: '松开加载'
        };
    },

    methods: {
        click(){
            this.scrollTop = 110;
        },

        touchEnd(){
            this.top_spinner_text = '正在努力加载';
        },

        touchStart(){
            this.top_spinner_text = '松开加载';
        },

    	addPage(){
    		this.viewPage++;
    	}
    },

    components: {
        ScrollView,
        SearchBar,
        MyCard,
        FloatBar,
        Spinner, 
        List
    },

    activated() {
        // 没办法
        // 让scrollTop的值变了才能触发callback去渲染dom
        if(0 < this.scrollTop) {
            this.scrollTop++;
        }
        
    }
}
</script>

<style scoped lang=scss>
>.header-spinner{
    p{padding: 0.15rem auto;}
}


.down_spinner{
	margin:0.15rem auto;
}
</style>
