#写个自定义vue的指令
**[js/css]**   **[2016-03-01 12:12:21]**

## 指令是啥玩意?
指令就是封装dom操作的函数, 只是调用方式和原生的函数的不同. 

## 调用指令
调用指令需要在html进行标记,系统默认集成了一些指令, 比如`v-show` `v-bind`
```javascript```
new Vue({
	data: {
		is_show: true
	}
})
// 改变is_show的值可以改变div的显示和隐藏
```
```html```
<div v-show="is_show"></div>
自定义指令也是通过"v-xxx"这种写法来调用, 比如`<div v-xxx="is_show"></div>`, 然后在写自定义指令时,写相应的操作dom的逻辑.
```

## 定义指令

```javascript
Vue.directive('xxx', {
	bind: function(){
		// 初始化指令时触发, 运行一次
	},
 	
 	update: function(newValue, oldValue){
 		// v-xxx="is_show, 当is_show变化的时候
 		// 会触发update里的代码
 		// newValue是变化后的值
 		// oldValue是变化前的值
 	},
 	unbind: function(){
		// 清理工作
    	// 例如，删除事件监听器等操作
 	}
})
```

## 官方demo
[打开](http://v1-cn.vuejs.org/examples/select2.html "demo")
