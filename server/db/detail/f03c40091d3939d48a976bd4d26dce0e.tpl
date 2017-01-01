<p>#写个vue的指令
<strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">指令是啥玩意?</h2>
<p>指令就是封装dom操作的函数, 只是调用方式和原声的函数不同.</p>
<h2 id="-">调用指令</h2>
<p>调用指令需要在html进行标记,系统默认集成了一些指令, 比如<code>v-show</code> <code>v-bind</code></p>
<pre><code class="lang-javascript```"><span class="hljs-selector-tag">new</span> <span class="hljs-selector-tag">Vue</span>({
    <span class="hljs-attribute">data</span>: {
        is_show: true
    }
})
</code></pre>
<pre><code class="lang-html```">&lt;<span class="hljs-keyword">div</span> v-show=<span class="hljs-string">"is_show"</span>&gt;&lt;/<span class="hljs-keyword">div</span>&gt;
</code></pre>
<p>vue呢是数据驱动的框架, 框架核心封装了大部分的dom操作, 比如app</p>
<h2 id="-">定义指令</h2>
<pre><code class="lang-javascript">Vue.directive(<span class="hljs-string">'demo'</span>, {
    bind: <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
        <span class="hljs-comment">// 初始化指令时触发, 运行一次</span>
    },

     update: <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
         <span class="hljs-comment">// </span>
     }
})
</code></pre>
<h2 id="-">定义指令</h2>
<pre><code class="lang-javascript">
</code></pre>
