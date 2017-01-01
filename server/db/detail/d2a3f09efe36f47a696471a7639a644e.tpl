<h1 id="-2016-12-24">函数的作用域 2016-12-24</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">代码</h2>
<pre><code class="lang-javascript"><span class="hljs-keyword">var</span> num = <span class="hljs-number">0</span>;
<span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">add</span>(<span class="hljs-params"></span>)</span>{
    <span class="hljs-keyword">var</span> num = <span class="hljs-number">0</span>;
    <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">add2</span>(<span class="hljs-params"></span>)</span>{
        num++;
    }
    <span class="hljs-built_in">console</span>.log(num); <span class="hljs-comment">// 1</span>
}
<span class="hljs-built_in">console</span>.log(num); <span class="hljs-comment">// 0;</span>
</code></pre>
<h2 id="-">作用域</h2>
<p>作用域可以理解为两个互不相交的内存空间, 每一个函数的的内部都是一个作用域</p>
<h2 id="-">作用域链</h2>
<p>在浏览器环境下最外层的作用域就是window作用域. 函数互相嵌套作用域也会进行相应的嵌套,就好像一条链穿起来所有的作用域, 内层的作用域内可以访问外层作用域的变量</p>
<h2 id="var-">var标识符</h2>
<p>var表示在当前作用域(scope)下声明一个新的<em>变量名</em>, 只有其内部的和内部函数可以获取到.</p>
<h2 id="-">应用</h2>
<p>为了防止命名冲突,可以给不同业务的代码嵌套一个function</p>
