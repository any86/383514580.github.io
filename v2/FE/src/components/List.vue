<template>
    <div class="com-list"> 
        <!-- 列表 -->
        <transition-group 
            :css="false" 
            tag="ul" 
            @before-enter="beforeEnter" 
            @enter="enter">

            <li v-for="(item , i) in list" :key="i" :data-index="i">
                <slot name="item" :row="item" :index="i"></slot>  
            </li>
        </transition-group>
        
        <!-- warning -->
        <p v-show="total < page && !loading" class="warning">没有更多文章喽!</p>
    </div>
</template>

<script>
import Velocity from 'velocity-animate'

export default {
    name: 'List',

    props: ['page', 'list', 'loading', 'each'],

    computed: {
        total(){
            return Math.ceil(this.list.length / this.each);
        }
    },

    watch: {
        page(){
            if(this.page >= this.total) {
                this.$emit('end');
            }
        }
    },

    methods: {
        beforeEnter(el) {
            el.style.webkitTransform = 'translateY(100px)';
            el.style.opacity = 0;
        },

        enter(el, done) {
            var index = el.dataset.index % this.each;
            setTimeout(function() {
                Velocity(el, {
                    translateY: 0,
                    opacity: 1
                }, {
                    complete: done
                }, {
                    duration: 1000
                })
            }, index * 300)
        }
    }
}
</script>
<style scoped lang=scss>
.com-list {
    will-change: all;
    max-width: 720px;
    margin: 0.15rem auto;
    display: block;
    overflow: hidden;
    >ul{
        >li{
            padding: 0.3rem 0.15rem;
            display: block;
            overflow: hidden;
        }
    }

    >.warning {
        text-align: center;
        font-size: 0.14rem;
        color: #aaa;
        margin: 0.3rem auto;
    }
}
</style>
