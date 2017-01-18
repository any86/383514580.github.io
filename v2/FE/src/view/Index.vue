<template>
    <scroll-view @touchstart="touchStart" @touchend="touchEnd" @scrolly="scrollyChange" :scroll_top="scroll_top"  @append="addPage">
        
        <div slot="bg">
            <spinner class="down_spinner">{{top_spinner_text}}</spinner>
        </div>


        <!-- 名片 -->
        <my-card @getHeight="getCardHeight"></my-card>
        
        <!-- 搜索 -->
        <search-bar v-show="scroll_top > card_height"></search-bar>

        <!-- 列表 -->
        <list :page="view_page" @end="no_more = true" :no_more="no_more"></list>    

        <!-- spinner -->
        <spinner class="down_spinner" v-show="!no_more"></spinner>

        <!-- 浮动按钮 -->
        <float-bar slot="not_in_body" v-show="0 < scroll_top"></float-bar>

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

    data(){
    	return {
    		scroll_top: 0,
            view_page: 1,
            no_more: false,
            card_height: 0,
            top_spinner_text: '松开加载'
        };
    },

    methods: {
        touchEnd(){
            this.top_spinner_text = '正在努力加载';
        },

        touchStart(){
            this.top_spinner_text = '松开加载';
        },

    	getCardHeight(card_height){
    		this.card_height = card_height;
    	},

    	scrollyChange(top){
    		this.scroll_top = top;
    	},

    	addPage(){
    		this.view_page++;
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
        // 让scroll_top的值变了才能触发callback去渲染dom
        this.scroll_top++;
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
