# 快速明白js原型
**[js/css]**   **[2016-12-24 12:12:21]**

## 原型就像是爸爸的工具箱  
原型就像是爸爸的工具箱, 想用什么不用自己买, 直接拿来用, 省钱(js中就是省内存), 嘿嘿.
```javascript```
function ParentBox(){
	// 爸爸函数
	this.using = '';
}
// 锤子
ParentBox.prototype.hammer = function(){
	this.using = 'hammer';
}
// 笔
ParentBox.prototype.pen = function(){
	this.using = 'pen';
}
```

## 儿子要用锤子
```javascript```
var p = new ParentBox();
p.hammer();
```
这时候儿子用的是父亲的锤子, 所以他不需要花钱(内存)哦.

## 当然儿子自己也可以买一个更大的锤子
```javascript```
p.bigHammer = function(){
	// 大锤子逻辑
};
```

## 父亲能用大锤子吗?
这时候父亲可是没办法直接使用的, 不孝啊..., 
```javascript```
ParentBox.prototype.bigHammer(); // undefined
```

## 父亲的二儿子能用吗?
不能...
```javascript```
var p2 = new ParentBox();
p2.bigHammer(); // undefined
```
## 为什么不直接在父亲本身定义方法
不通过原型在父函数上定义一系列的方法和属性, 那么当实例化对象(儿子)的时候, 每次都要在内存中重建(重新买)父亲相同的方法和属性, 这样很显然浪费内存(钱)
