<h1 id="node-">node删除非空文件夹</h1>
<p><strong>[nodejs]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">代码</h2>
<pre><code class="lang-Javascript">function rmdirSync2(<span class="hljs-keyword">dir</span>) {
    files = fs.readdirSync(<span class="hljs-keyword">dir</span>);
    files.<span class="hljs-keyword">forEach</span>(<span class="hljs-keyword">file</span>=&gt;{
        <span class="hljs-keyword">if</span>(fs.statSync(<span class="hljs-keyword">dir</span> + <span class="hljs-keyword">file</span>).isDirectory()){
            <span class="hljs-comment">// 文件夹</span>
            rmdirSync2(<span class="hljs-keyword">dir</span> + <span class="hljs-keyword">file</span> + '/');
        } <span class="hljs-keyword">else</span> {
            <span class="hljs-comment">// 文件</span>
            fs.unlinkSync(<span class="hljs-keyword">dir</span> + <span class="hljs-keyword">file</span>);
        }
    });
    fs.rmdirSync(<span class="hljs-keyword">dir</span>);
}
rmdirSync2(DESC_DIR);
</code></pre>
