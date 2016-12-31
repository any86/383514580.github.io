# vuex的简单使用 2016-12-20

##本文适合读者
可以使用vue-cli开发项目, 本文的例子都是基于他来写的, 但是如果只是了解概念那就无所谓了, 后续有时间我会写一个不依赖vue-cli的小例子.


##vuex用来干什么的?
对于vuex简单来说是把vue中`data`参数的数据结构`单独拿了出来`进行`管理`


##为什么单独管理?
当组件关系变得复杂的时候, 如果用prop或者内部的信息传播机制共享数据会使代码结构乱到难以维护, 所以vuex出现了, 使用前提建立在`复杂项目`下, 如果项目内部的组件很少请不要使用vuex, 因为用vuex会有增加代码量(需要写出State, Mutations, Action等代码结构);


##写一个小例子前的准备工作
.首先, 建立一个store.js文件, 放在和入口main.js同级, 这就可以把store想成vuex的一个实例好了(个人方法, 并非正确); store里面有State, Mutations, Action等代码结构.

`store.js`
```javascript
// 引入 vuex
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex);
export default new Vuex.Store({
	// State, Mutations, Action等代码结构
});
```

`main.js`:
```javascript
// 引入 store
import Vue from 'vue'
import App from './App'
import store from './store'

new Vue({
    store, // 注入store
    el: '#app',
    template: '<App/>',
    components: { App }
});
```

## 写个最简单的例子

`store.js`
```javascript
const store = new Vuex.Store({
  state: {
    count: 1
  },
  mutations: {
    incrementSync (state) {
      state.count++
    }
  },
  actions: {
  	resetAsyn (context) {
       	setTimeout(()=>{
       		.commit('incrementSync', 0);
       	}, 1000);
  	}
});
```


## State
可以类比原来vue中的data参数; 这些数据放在这主要是为了多组件共享.
声明state.

组件内读取: 
```javascript
this.$store.state.count;
```
组件内设置
`不可以直接操作state, 同步操作用mutation, 异步用action`


## Mutation
对state的数据的变更操作都需要通过mutation来操作
组件内调用
this.$store.commit('incrementSync');

## Action
对于异步获取的数据用action来包装, 然后通过调用mutation来修改state
组件内调用
this.$store.dispatch('resetAsyn');

## 总之
总之vuex的出现是为了在组件数量很多,数据共享复杂的情况下的一种组件间数据共享的解决方案, 或者叫逻辑规范.




