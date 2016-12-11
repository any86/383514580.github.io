import Vue from 'vue'
import App from './App'
import store from './vuex/store'
import router from './router'

// touch
/*import Hammer from '../static/hammer.min.js'
var myElement = document.getElementById('touch');
var mc = new Hammer(myElement);
mc.on("panleft panright tap press", function(ev) {
    console.log(ev.distance, ev);
});*/

/* eslint-disable no-new */
new Vue({
    store,
    el: '#app',
    template: '<App/>',
    router,
    components: { App }
})
