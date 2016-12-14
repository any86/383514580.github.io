import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
import Index from './view/Index'
import Detail from './view/Detail'
// 路由配置
const routes = [
    { path: '/', component: Index },
    { path: '/index', component: Index, name: 'index' },
    { path: '/detail/:id', component: Detail, name: 'detail' }
];
// 初始化路由
export default new VueRouter({
    routes
    /*    scrollBehavior(to, from, savedPosition) {
            if (savedPosition) {
                return savedPosition
            } else {
                return { x: 0, y: 0 }
            }
        }*/
})
