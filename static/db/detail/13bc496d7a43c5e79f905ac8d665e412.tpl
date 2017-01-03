<p>#写个自定义vue的指令
<strong>[js/css]</strong>   <strong>[2016-03-01 12:12:21]</strong></p>
<h2 id="-">指令是啥玩意?</h2>
<p>指令就是封装dom操作的函数, 只是调用方式和原生的函数的不同. </p>
<h2 id="-">调用指令</h2>
<p>调用指令需要在html进行标记,系统默认集成了一些指令, 比如<code>v-show</code> <code>v-bind</code></p>
<pre><code class="lang-javascript```"><span class="hljs-selector-tag">new</span> <span class="hljs-selector-tag">Vue</span>({
    <span class="hljs-attribute">data</span>: {
        <span class="hljs-attribute">is_show</span>: true
    }
})
<span class="hljs-comment">// 改变is_show的值可以改变div的显示和隐藏</span>
</code></pre>
<pre><code class="lang-html```">&lt;<span class="hljs-keyword">div</span> v-show=<span class="hljs-string">"is_show"</span>&gt;&lt;/<span class="hljs-keyword">div</span>&gt;
自定义指令也是通过<span class="hljs-string">"v-xxx"</span>这种写法来调用, 比如`&lt;<span class="hljs-keyword">div</span> v-xxx=<span class="hljs-string">"is_show"</span>&gt;&lt;/<span class="hljs-keyword">div</span>&gt;`, 然后在写自定义指令时,写相应的操作dom的逻辑.
</code></pre>
<h2 id="-">定义指令</h2>
<pre><code class="lang-javascript">Vue.directive(<span class="hljs-string">'xxx'</span>, {
    bind: <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
        <span class="hljs-comment">// 初始化指令时触发, 运行一次</span>
    },

     update: <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">(newValue, oldValue)</span></span>{
         <span class="hljs-comment">// v-xxx="is_show, 当is_show变化的时候</span>
         <span class="hljs-comment">// 会触发update里的代码</span>
         <span class="hljs-comment">// newValue是变化后的值</span>
         <span class="hljs-comment">// oldValue是变化前的值</span>
     },
     unbind: <span class="hljs-function"><span class="hljs-keyword">function</span><span class="hljs-params">()</span></span>{
        <span class="hljs-comment">// 清理工作</span>
        <span class="hljs-comment">// 例如，删除事件监听器等操作</span>
     }
})
</code></pre>
<h2 id="-demo">官方demo</h2>
<p><a href="http://v1-cn.vuejs.org/examples/select2.html" title="demo">打开demo</a></p>
