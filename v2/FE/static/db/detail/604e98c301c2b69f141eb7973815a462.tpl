<h1 id="-">事件捕获和事件冒泡</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">什么是事件?</h2>
<p>click mouseout 等等</p>
<h2 id="-">什么是事件传播?</h2>
<p>当触发事件后, 事件会在dom元素中发生传播, 首先从document层开始传播, 直至事件到达目标元素(绑定事件的元素), 运行绑定的函数(handle),  然后开始向document方向传递.
发生顺序: </p>
<ol>
<li>事件捕获</li>
<li>事件处于目标上 </li>
<li>事件冒泡  </li>
</ol>
<h2 id="-handle-">如何控制handle在捕获阶段或者冒泡阶段运行?</h2>
<pre><code class="lang-javascript"><span class="hljs-comment">// 函数</span>
dom.addEventListener(<span class="hljs-function"><span class="hljs-keyword">method</span>, <span class="hljs-title">handle</span>, <span class="hljs-title">bool</span>);</span>

<span class="hljs-comment">//事件捕获阶段触发handle</span>
dom.addEventListener(<span class="hljs-function"><span class="hljs-keyword">method</span>, <span class="hljs-title">handle</span>, <span class="hljs-title">true</span>);</span>

<span class="hljs-comment">//事件冒泡阶段触发handle</span>
dom.addEventListener(<span class="hljs-function"><span class="hljs-keyword">method</span>, <span class="hljs-title">handle</span>, <span class="hljs-title">false</span>);</span>
</code></pre>
<p>注: onclick/onblur这种绑定函数的方法, 事件是在冒泡阶段触发.</p>
<h2 id="-handle-">控制handle在哪个阶段触发有什么用?.</h2>
<p>控制时机可以控制嵌套关系的元素的事件发生顺序.</p>
