<h1 id="-ie8-">小于IE8实现背景透明,文字不透明</h1>
<p><strong>[css]</strong>   <strong>[2015-11-24 12:12:21]</strong></p>
<h2 id="-ok">一行代码ok</h2>
<pre><code class="lang-css```"><span class="hljs-selector-tag">div</span>{<span class="hljs-attribute">filter</span>: progid:DXImageTransform.Microsoft.<span class="hljs-built_in">Gradient</span>(startColorstr=#cc000000,endColorstr=#cc000000);}
</code></pre>
<p>ie滤镜参数#cc000000,前两位为16进制透明度,比如说值是上面用到的0.8，那么就是0.8×255＝204，再转换成16进制为cc</p>
<pre><code class="lang-javascript```"><span class="hljs-comment">// 输入透明度</span>
<span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">convert</span>(<span class="hljs-params">n</span>)</span>{
    <span class="hljs-keyword">return</span> (n * <span class="hljs-number">255</span>).toString(<span class="hljs-number">16</span>);
}
<span class="hljs-built_in">console</span>.log(convert(<span class="hljs-number">.8</span>));
</code></pre>
<h2 id="-ie-8">附送一个整体透明, IE&lt;=8</h2>
<pre><code class="lang-css```"><span class="hljs-selector-tag">div</span>{<span class="hljs-attribute">filter</span>: progid:DXImageTransform.Microsoft.<span class="hljs-built_in">Alpha</span>(opacity=70);}
</code></pre>
