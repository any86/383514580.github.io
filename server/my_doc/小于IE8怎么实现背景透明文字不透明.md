# 小于IE8实现背景透明,文字不透明
**[css]**   **[2015-11-24 12:12:21]**

## 1行代码
```css```
div{filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr=#88000000,endColorstr=#88000000);}
```
ie滤镜参数#88000000,前两位为16进制透明度,比如说值是上面用到的0.2，那么就是0.2×255＝51，再转换成16进制为33

