<h1 id="-">内存回收</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">回收如何触发</h2>
<pre><code class="lang-javascript```"><span class="hljs-comment">// IE中, 不建议用</span>
<span class="hljs-built_in">window</span>.CollectGarbage();
</code></pre>
<p>别高兴的太早,实际上大部分浏览器的回收机制都是自动的,你还真没办法这样手动回收, 请继续往下看.</p>
<h2 id="-">标记变量被回收</h2>
<p>我们不能控制什么时间变量被回收, 因为回收是系统自动定时循环触发, 所以我们要做的是当回收发生的时候我们标记好那些变量要被回收, 有点像上学时候的考试交卷子, 你想提前交卷, 不可以.</p>
<h2 id="-">普通的变量标记</h2>
<p>其实一般情况下, 标记也是系统自动的, 我们根本不需要做什么, 比如:</p>
<pre><code class="lang-javascript```">function fn(){
    var obj = {a: <span class="hljs-number">1</span>, <span class="hljs-keyword">b: </span><span class="hljs-number">2</span>}<span class="hljs-comment">;</span>
    obj.<span class="hljs-keyword">b </span>= <span class="hljs-number">3</span><span class="hljs-comment">;</span>
}
fn()<span class="hljs-comment">;</span>
</code></pre>
<p>当函数运行完毕, 就已经自动被标记为<code>可回收</code>了.但是当变量被相互引用的时候, 系统就不会给你标记<code>可回收</code>了.这时候需要我们在函数运行完毕后切断相互引用.</p>
<pre><code class="lang-javascript```"><span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">fn</span>(<span class="hljs-params"></span>)</span>{
    <span class="hljs-keyword">var</span> obj = {<span class="hljs-attr">a</span>: <span class="hljs-number">1</span>, <span class="hljs-attr">b</span>: <span class="hljs-number">2</span>};
    <span class="hljs-keyword">var</span> dom = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">'el'</span>);
    <span class="hljs-keyword">var</span> dom.copy = obj;
    obj.el = dom;
    <span class="hljs-comment">//xxx 其他操作代码</span>
}
<span class="hljs-comment">// 切断引用后,系统就可以标记成可回收了</span>
dom.copy = <span class="hljs-literal">null</span>;
obj.el = <span class="hljs-literal">null</span>;
</code></pre>
<h2 id="-">图片内存资源的回收</h2>
<p>拿淘宝网站列表页举例, 当我们向下滑动了很多页后, 上面的图片其实是都看不到的, 但是图片实际还是占用内存的,这时候就需要我们<strong>切断图片和dom的引用</strong>.</p>
<pre><code class="lang-javascript```"><span class="hljs-comment">// imgs是已经被浏览过,并且不在可视区域的图片</span>
imgs.<span class="hljs-keyword">forEach</span>(<span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">(img)</span></span>{
    <span class="hljs-comment">// 不要变成空字符串, 那样排版可能会错乱</span>
    img.src = <span class="hljs-string">'data:image/gif;base64,R0lGODlhAwADAIABAL6+vv///yH5BAEAAAEALAAAAAADAAMAAAIDjA9WADs= '</span>;
})
</code></pre>
