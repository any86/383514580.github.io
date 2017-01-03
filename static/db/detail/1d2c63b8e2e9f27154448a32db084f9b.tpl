<h1 id="-ie8-">小于IE8实现背景透明,文字不透明</h1>
<p><strong>[css]</strong>   <strong>[2015-11-24 12:12:21]</strong></p>
<h2 id="1-">1行代码</h2>
<pre><code class="lang-css```"><span class="hljs-selector-tag">div</span>{<span class="hljs-attribute">filter</span>: progid:DXImageTransform.Microsoft.<span class="hljs-built_in">Gradient</span>(startColorstr=#88000000,endColorstr=#88000000);}
</code></pre>
<p>ie滤镜参数#88000000,前两位为16进制透明度,比如说值是上面用到的0.2，那么就是0.2×255＝51，再转换成16进制为33</p>
