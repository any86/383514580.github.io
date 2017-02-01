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
        <spinner slot="background" class="header-spinner">
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
            <!-- 列表  -->
            <list 
                class="listview" 
                :each="listEach" 
                :page="page" 
                :list="list" 
                :loading="listLoading"
                @end="isEnd = true">

                <template scope="props" slot="item">
                    <span class="category">[ {{props.row.category}} ]</span>

                    <router-link class="title" :to="{ name: 'detail', params: { id: props.row.id }}" tag="h1">
                        {{props.row.title}}
                    </router-link>

                    <p class="time">{{props.row.create_time}}</p>

                    <p class="desc" v-html="props.row.desc"></p>

                    <router-link class="btn-view" :to="{ name: 'detail', params: { id: props.row.id }}" tag="a">查看全部</router-link>
                </template>
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
            listLoading: true,
            listEach: 3,
    		y: 0,
            page: 1,
            isEnd: false,
            topSpinnerText: '松开加载'
        };
    },

    computed: {
        list(){
            return this.listData.filter((item, i)=>{
                    return (this.listEach * this.page > i);
            });
        }
    },

    mounted(){
        this.$store.dispatch('getList').then(() => {
            this.listLoading = false;
            this.listData    = this.$store.state.list;
        });
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

/*列表项*/
$font_color: #444;
.listview {
    a,p{font-size: 0.14rem;}
    a:visited {
        text-decoration: none;
        outline: none;
        border: none;
    }
    .category {
        display: inline-block;
        padding: 0.05rem 0;
        letter-spacing: 1px;
        font-size: 0.2rem;
    }
    .title {
        font-size: 0.2rem;
        color: #333;
        display: inline-block;
        letter-spacing: 1px;
        font-weight: 600;
        cursor: pointer;
    }
    .desc {
        margin-top: 0.15rem;
        letter-spacing: 0.01rem;
        color: $font_color;
        display: block;
        line-height: 1.5;
        letter-spacing: 1px;
    }
    .time {
        display: block;
        color: $font_color;
        letter-spacing: 1px;
        height: 0.3rem;
        line-height: 0.3rem;
    }
    .btn-view {
        padding: 0.05rem;
        margin-top: 0.3rem;
        width: 0.7rem;
        background: #999;
        color: #fff;
        clear: both;
        cursor: pointer;
        display: block;
        text-align: center;
        border-radius: 4px;
        box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);
    }
}

</style>
