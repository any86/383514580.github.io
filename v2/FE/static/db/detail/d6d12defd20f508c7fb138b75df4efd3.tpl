<h1 id="-js-">快速明白js原型</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">原型就像是爸爸的工具箱</h2>
<p>原型就像是爸爸的工具箱, 想用什么不用自己买, 直接拿来用, 省钱(js中就是省内存), 嘿嘿.</p>
<pre><code class="lang-javascript```"><span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">ParentBox</span><span class="hljs-params">()</span></span>{
    <span class="hljs-comment">// 爸爸函数</span>
    <span class="hljs-keyword">this</span>.using = <span class="hljs-string">''</span>;
}
<span class="hljs-comment">// 锤子</span>
ParentBox.prototype.hammer = <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
    <span class="hljs-keyword">this</span>.using = <span class="hljs-string">'hammer'</span>;
}
<span class="hljs-comment">// 笔</span>
ParentBox.prototype.pen = <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
    <span class="hljs-keyword">this</span>.using = <span class="hljs-string">'pen'</span>;
}
</code></pre>
<h2 id="-">儿子要用锤子</h2>
<pre><code class="lang-javascript```"><span class="hljs-keyword">var</span> p = <span class="hljs-function"><span class="hljs-keyword">new</span> <span class="hljs-title">ParentBox</span>();
<span class="hljs-title">p</span>.<span class="hljs-title">hammer</span>();</span>
</code></pre>
<p>这时候儿子用的是父亲的锤子, 所以他不需要花钱(内存)哦.</p>
<h2 id="-">当然儿子自己也可以买一个更大的锤子</h2>
<pre><code class="lang-javascript```">p.bigHammer = <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
    <span class="hljs-comment">// 大锤子逻辑</span>
};
</code></pre>
<h2 id="-">父亲能用大锤子吗?</h2>
<p>这时候父亲可是没办法直接使用的, 不孝啊..., </p>
<pre><code class="lang-javascript```"><span class="hljs-type">ParentBox</span>.proto<span class="hljs-keyword">type</span>.bigHammer(); // undefined
</code></pre>
<h2 id="-">父亲的二儿子能用吗?</h2>
<p>不能...</p>
<pre><code class="lang-javascript```"><span class="hljs-keyword">var</span> p2 = <span class="hljs-function"><span class="hljs-keyword">new</span> <span class="hljs-title">ParentBox</span>();
<span class="hljs-title">p2</span>.<span class="hljs-title">bigHammer</span>(); <span class="hljs-comment">// undefined</span></span>
</code></pre>
<h2 id="-">为什么不直接在父亲本身定义方法</h2>
<p>不通过原型在父函数上定义一系列的方法和属性, 那么当实例化对象(儿子)的时候, 每次都要在内存中重建(重新买)父亲相同的方法和属性, 这样很显然浪费内存(钱)</p>
