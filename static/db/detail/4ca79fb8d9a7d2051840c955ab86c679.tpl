<h1 id="vue-jq-">vue和jq的一些类比</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<p>##控制元素显示隐藏(应用场景: tab, slider, popup等).</p>
<p>jq:</p>
<pre><code class="lang-html"><span class="hljs-tag">&lt;<span class="hljs-name">ul</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"tab-head"</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> <span class="hljs-attr">data-i</span>=<span class="hljs-string">"0"</span>&gt;</span>切换到1<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> <span class="hljs-attr">data-i</span>=<span class="hljs-string">"1"</span>&gt;</span>切换到2<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> <span class="hljs-attr">data-i</span>=<span class="hljs-string">"2"</span>&gt;</span>切换到3<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">ul</span>&gt;</span>

<span class="hljs-tag">&lt;<span class="hljs-name">ul</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"tab-body"</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span>&gt;</span>内容1<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span>&gt;</span>内容2<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span>&gt;</span>内容3<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">ul</span>&gt;</span>
</code></pre>
<pre><code class="lang-javascript"><span class="hljs-comment">// 简单写下逻辑, 勿直接用于实际项目</span>
$(<span class="hljs-string">'.tab-head'</span>).on(<span class="hljs-string">'click'</span>, <span class="hljs-string">'li'</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
  <span class="hljs-keyword">var</span> i = $(<span class="hljs-keyword">this</span>).data(<span class="hljs-string">'i'</span>);
  <span class="hljs-keyword">var</span> children = $(<span class="hljs-string">'.tab-body'</span>).children(<span class="hljs-string">'li'</span>);
  children.forEach(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">j</span>)</span>{
    <span class="hljs-keyword">if</span>(j == i) children[j].css({<span class="hljs-string">'display'</span>: <span class="hljs-string">'block'</span>});
    <span class="hljs-keyword">else</span> children[j].css({<span class="hljs-string">'display'</span>: <span class="hljs-string">'none'</span>});
  })
});
</code></pre>
<p>vue:</p>
<pre><code class="lang-html"><span class="hljs-tag">&lt;<span class="hljs-name">ul</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"tab-head"</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> @<span class="hljs-attr">click</span>=<span class="hljs-string">"change(0)"</span>&gt;</span>切换到1<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> @<span class="hljs-attr">click</span>=<span class="hljs-string">"change(1)"</span>&gt;</span>切换到2<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> @<span class="hljs-attr">click</span>=<span class="hljs-string">"change(2)"</span>&gt;</span>切换到3<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">ul</span>&gt;</span>

<span class="hljs-tag">&lt;<span class="hljs-name">ul</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"tab-body"</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> <span class="hljs-attr">v-show</span>=<span class="hljs-string">"i==0"</span>&gt;</span>内容1<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> <span class="hljs-attr">v-show</span>=<span class="hljs-string">"i==1"</span>&gt;</span>内容2<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">li</span> <span class="hljs-attr">v-show</span>=<span class="hljs-string">"i==2"</span>&gt;</span>内容3<span class="hljs-tag">&lt;/<span class="hljs-name">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">ul</span>&gt;</span>
</code></pre>
<pre><code class="lang-javascript"><span class="hljs-selector-tag">new</span> <span class="hljs-selector-tag">Vue</span>({
  <span class="hljs-attribute">data</span>: {i: <span class="hljs-number">0</span>},
  <span class="hljs-selector-tag">methods</span>: {
    <span class="hljs-attribute">change</span>: <span class="hljs-built_in">function</span>(j){
      this.i = j
    }
  }
})
</code></pre>
<h2 id="-">优点</h2>
<p>1.vue无需操作dom, 减少了操作dom的代码量, 同时也避免了操作dom时候可能出现错误, 一举两得.</p>
<p>2.代码量小, 视觉上代码结构就更清晰, 同时如果谷歌浏览器安装了<code>vue-devtool</code>,那么我们在data中定义的数据结构是可以看见数据实时变化的,调试更方便.</p>
