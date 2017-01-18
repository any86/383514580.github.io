import Vue from 'vue'
import App from './App'
import store from './vuex/store'
import router from './router'

// import _ from 'underscore'
// window._ = _;

import VueCordova from 'vue-cordova'
Vue.use(VueCordova);

// add cordova.js only if serving the app through file://
if (window.location.protocol === 'file:') {
  var cordovaScript = document.createElement('script')
  cordovaScript.setAttribute('type', 'text/javascript')
  cordovaScript.setAttribute('src', 'cordova.js')
  document.body.appendChild(cordovaScript)
}

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
    StatusBar.hide();
});
