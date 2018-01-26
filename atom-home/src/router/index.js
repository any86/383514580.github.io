import Vue from 'vue'
import Router from 'vue-router'
import Install from '@/pages/Install';
import SwitchDemo from '@/pages/Switch';

Vue.use(Router)

export default new Router({
    routes: [{
            path: '/switch',
            name: 'Switch',
            component: SwitchDemo
        },
        {
            path: '/install',
            name: 'Install',
            component: Install
        }

    ]
})