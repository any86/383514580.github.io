import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/pages/HelloWorld';
import Install from '@/pages/Install';


Vue.use(Router)

export default new Router({
    routes: [{
            path: '/hello',
            name: 'HelloWorld',
            component: HelloWorld
        },
        {
            path: '/install',
            name: 'Install',
            component: Install
        }

    ]
})