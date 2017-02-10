<h1 id="-">判断是否为空</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">代码</h2>
<pre><code class="lang-javascript```">  <span class="hljs-keyword">var</span> isEmpty = <span class="hljs-function"><span class="hljs-keyword">function</span></span>(obj) {
    <span class="hljs-keyword">if</span> (obj == <span class="hljs-literal">null</span>) <span class="hljs-keyword">return</span> <span class="hljs-literal">true</span>;
    <span class="hljs-keyword">if</span> (<span class="hljs-literal">_</span>.isArray(obj) || <span class="hljs-literal">_</span>.isString(obj)) <span class="hljs-keyword">return</span> obj.length === <span class="hljs-number">0</span>;
    <span class="hljs-keyword">for</span> (<span class="hljs-keyword">var</span> key <span class="hljs-keyword">in</span> obj) <span class="hljs-keyword">if</span> (obj.hasOwnProperty(key)) <span class="hljs-keyword">return</span> <span class="hljs-literal">false</span>;
    <span class="hljs-keyword">return</span> <span class="hljs-literal">true</span>;
  };
</code></pre>
<p>代码来自underscre.js</p>
