<h1 id="-">滚动条控制</h1>
<p><strong>[js/css]</strong> <strong>[2016-12-21 11:12:21]</strong></p>
<p>注：如无特别标注，那么全部浏览器都兼容</p>
<h2 id="window-">window滚动条</h2>
<p>读取：</p>
<pre><code class="lang-javascript"><span class="hljs-comment">// IE &gt; 8，以及其他现代浏览器</span>
<span class="hljs-built_in">console</span>.log(<span class="hljs-built_in">window</span>.pageXOffset); 
<span class="hljs-built_in">console</span>.log(<span class="hljs-built_in">window</span>.pageYOffset);

<span class="hljs-comment">// IE &lt;= 8</span>
<span class="hljs-built_in">console</span>.log(<span class="hljs-built_in">document</span>.body.scrollLeft); 
<span class="hljs-built_in">console</span>.log(<span class="hljs-built_in">document</span>.body.scrollTop);
</code></pre>
<p>设置:</p>
<pre><code class="lang-javascript"><span class="hljs-built_in">window</span>.<span class="hljs-keyword">scroll</span>(x, y);
</code></pre>
<h2 id="dom-">dom元素的滚动条</h2>
<p>读取：</p>
<pre><code class="lang-javascript">
<span class="hljs-built_in">console</span>.log(<span class="hljs-built_in">window</span>.scrollTop); 
<span class="hljs-built_in">console</span>.log(<span class="hljs-built_in">window</span>.scrollLeft);
</code></pre>
<p>设置:</p>
<pre><code class="lang-javascript">window.<span class="hljs-keyword">scrollTop </span>= <span class="hljs-number">100</span><span class="hljs-comment">; </span>
window.<span class="hljs-keyword">scrollLeft </span>= <span class="hljs-number">100</span><span class="hljs-comment">;</span>
</code></pre>
