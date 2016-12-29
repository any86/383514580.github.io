import Vue from 'vue'
import App from './App'
import store from './vuex/store'
import router from './router'

import VueCordova from 'vue-cordova'
Vue.use(VueCordova);


/* eslint-disable no-new */
new Vue({
    store,
    data() {
        return {
            cordova: Vue.cordova
        }
    },
    el: '#app',
    template: '<App/>',
    router,
    components: { App }
});

Vue.cordova.on('deviceready', () => {
    alert('可以!');
});
