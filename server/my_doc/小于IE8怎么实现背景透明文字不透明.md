# 小于IE8实现背景透明,文字不透明
**[css]**   **[2015-11-24 12:12:21]**

## 一行代码ok
```css```
div{filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr=#cc000000,endColorstr=#cc000000);}
```
ie滤镜参数#cc000000,前两位为16进制透明度,比如说值是上面用到的0.8，那么就是0.8×255＝204，再转换成16进制为cc

```javascript```
// 输入透明度
function convert(n){
	return (n * 255).toString(16);
}
console.log(convert(.8));
```

## 附送一个整体透明, IE<=8
```css```
div{filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);}
```