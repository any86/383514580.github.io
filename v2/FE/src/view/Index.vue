<template>
    <scroll-view @scrolly="scrollyChange" :scroll_top="scroll_top"  @append="addPage">
        <!-- 名片 -->
        <my-card @getHeight="getCardHeight"></my-card>
        
        <!-- 搜索 -->
        <search-bar v-show="scroll_top > card_height"></search-bar>

        <!-- 列表 -->
        <list :page="view_page" @end="no_more = true" :no_more="no_more"></list>    

        <!-- loader -->
        <loader class="down_loader" :opts="{show: !no_more}"></loader>

        <!-- 浮动按钮 -->
        <float-bar v-show="0 < scroll_top"></float-bar>

    </scroll-view>
</template>

<script>
import ScrollView from '../components/ScrollView'
import SearchBar from '../components/SearchBar'
import MyCard from '../components/MyCard'
import FloatBar from '../components/FloatBar'
import List from '../components/List'
import Loader from '../components/Loader'

export default {
    name: 'Index',

    data(){
    	return {
    		scroll_top: 0,
            view_page: 1,
            no_more: false,
            card_height: 0
        };
    },

    methods: {
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
        Loader, 
        List
    },

    activated() {
        // window.scrollTo(0, this.$store.state.index_pos_y);
    }
}
</script>

<style scoped lang=scss>
.down_loader{
	margin:0.15rem auto;
}
</style>
