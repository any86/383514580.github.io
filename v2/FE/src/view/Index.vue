<template>

    <scroll-view 
        ref="scrollView"
        :pullable="true"
        @scrolly = "scrollY"
        @touchstart="touchStart" 
        @touchend="touchEnd" 
        @append="addPage">

        <!-- 背景 -->
        <!-- slot: background -->
        <spinner slot="background" class="down-spinner">
            {{topSpinnerText}}
        </spinner>
        
        <!-- 名片 -->
        <!-- slot: before-content -->
        <my-card slot="before-content"></my-card>
        
        <!-- 搜索 -->
        <!-- slot:header-fixed -->
        <search-bar slot="header-fixed"></search-bar>
        
        <!-- slot: content -->
        <template slot="content">
            <!-- 列表 -->
            <list :keyword="$route.query.keyword" :page="page" @end="isEnd = true">
            </list>    

            <!-- spinner -->
            <spinner class="down-spinner" v-show="!isEnd"></spinner>
        </template>

        <!-- 浮动按钮 -->
        <!-- slot: 默认插槽 -->
        <back-top v-show="0 < y"></back-top>

    </scroll-view>
</template>

<script>
import ScrollView from '../components/ScrollView'
import SearchBar from '../components/SearchBar'
import MyCard from '../components/MyCard'
import BackTop from '../components/BackTop'
import List from '../components/List'
import Spinner from '../components/Spinner'

export default {
    name: 'Index',

    data(){
    	return {
            listData: [],
            listLength: null,
    		y: 0,
            page: 1,
            isEnd: false,
            topSpinnerText: '松开加载'
        };
    },

    methods: {
        scrollY(y){
            this.y = y;
        },

        touchEnd(){
            this.topSpinnerText = '正在努力加载';
        },

        touchStart(){
            this.topSpinnerText = '松开加载';
        },

    	addPage(){
    		this.page++;
    	}
    },

    components: {
        ScrollView,
        SearchBar,
        MyCard,
        BackTop,
        Spinner, 
        List
    },

    activated() {
        this.$refs.scrollView.$el.scrollTop = this.y;        
    }
}
</script>

<style scoped lang=scss>
>.header-spinner{
    p{padding: 0.15rem auto;}
}


.down-spinner{
	margin:0.15rem auto;
}
</style>
