# vue和jq的一些类比 2016-12-21


##控制元素显示隐藏(应用场景: tab, slider, popup等).

jq:
```html
<ul class="tab-head">
  <li data-i="0">切换到1</li>
  <li data-i="1">切换到2</li>
  <li data-i="2">切换到3</li>
</ul>

<ul class="tab-body">
  <li>内容1</li>
  <li>内容2</li>
  <li>内容3</li>
</ul>
```

```javascript
// 简单写下逻辑, 勿直接用于实际项目
$('.tab-head').on('click', 'li', function(){
  var i = $(this).data('i');
  var children = $('.tab-body').children('li');
  children.forEach(function(j){
    if(j == i) children[j].css({'display': 'block'});
    else children[j].css({'display': 'none'});
  })
});
```

vue:
```html
<ul class="tab-head">
  <li @click="change(0)">切换到1</li>
  <li @click="change(1)">切换到2</li>
  <li @click="change(2)">切换到3</li>
</ul>

<ul class="tab-body">
  <li v-show="i==0">内容1</li>
  <li v-show="i==1">内容2</li>
  <li v-show="i==2">内容3</li>
</ul>
```

```javascript
new Vue({
  data: {i: 0},
  methods: {
    change: function(j){
      this.i = j
    }
  }
})
```

## 优点
1.vue无需操作dom, 减少了操作dom的代码量, 同时也避免了操作dom时候可能出现错误, 一举两得.

2.代码量小, 视觉上代码结构就更清晰, 同时如果谷歌浏览器安装了`vue-devtool`,那么我们在data中定义的数据结构是可以看见数据实时变化的,调试更方便.



