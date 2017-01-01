#写个vue的指令
**[js/css]**   **[2016-12-24 12:12:21]**

## 指令是啥玩意?
指令就是封装dom操作的函数, 只是调用方式和原声的函数不同.

## 调用指令
调用指令需要在html进行标记,系统默认集成了一些指令, 比如`v-show` `v-bind`
```javascript```
new Vue({
	data: {
		is_show: true
	}
})
```
```html```
<div v-show="is_show"></div>

```
vue呢是数据驱动的框架, 框架核心封装了大部分的dom操作, 比如app

## 定义指令
```javascript
Vue.directive('demo', {
	bind: function(){
		// 初始化指令时触发, 运行一次
	},
 	
 	update: function(){
 		// 
 	}
})
```

## 定义指令
```javascript

```



