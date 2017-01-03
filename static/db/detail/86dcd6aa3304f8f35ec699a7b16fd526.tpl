<h1 id="chai">chai</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<p>###3种断言风格</p>
<blockquote>
<p>should</p>
<pre><code class="lang-javascript"><span class="hljs-selector-tag">chai</span><span class="hljs-selector-class">.should</span>();
<span class="hljs-selector-tag">foo</span><span class="hljs-selector-class">.should</span><span class="hljs-selector-class">.be</span><span class="hljs-selector-class">.a</span>(<span class="hljs-string">'string'</span>);
<span class="hljs-selector-tag">foo</span><span class="hljs-selector-class">.should</span><span class="hljs-selector-class">.equal</span>(<span class="hljs-string">'bar'</span>);
<span class="hljs-selector-tag">foo</span><span class="hljs-selector-class">.should</span><span class="hljs-selector-class">.have</span><span class="hljs-selector-class">.length</span>(<span class="hljs-number">3</span>);
<span class="hljs-selector-tag">tea</span><span class="hljs-selector-class">.should</span><span class="hljs-selector-class">.have</span><span class="hljs-selector-class">.property</span>(<span class="hljs-string">'flavors'</span>)
  <span class="hljs-selector-class">.with</span><span class="hljs-selector-class">.length</span>(<span class="hljs-number">3</span>);
</code></pre>
</blockquote>
<pre><code class="lang-javascript">var expect = require(<span class="hljs-string">'chai'</span>).expect;
// 相等或不相等
expect(<span class="hljs-number">4</span> + <span class="hljs-number">5</span>).<span class="hljs-keyword">to</span>.be.equal(<span class="hljs-number">9</span>);
expect(<span class="hljs-number">4</span> + <span class="hljs-number">5</span>).<span class="hljs-keyword">to</span>.be.not.equal(<span class="hljs-number">10</span>);
expect(foo).<span class="hljs-keyword">to</span>.be.deep.equal({ bar: <span class="hljs-string">'baz'</span> });

// 布尔值为<span class="hljs-literal">true</span>
expect(<span class="hljs-string">'everthing'</span>).<span class="hljs-keyword">to</span>.be.ok;
expect(<span class="hljs-literal">false</span>).<span class="hljs-keyword">to</span>.not.be.ok;

// typeof
expect(<span class="hljs-string">'test'</span>).<span class="hljs-keyword">to</span>.be.a(<span class="hljs-string">'string'</span>);
expect({ foo: <span class="hljs-string">'bar'</span> }).<span class="hljs-keyword">to</span>.be.an(<span class="hljs-string">'object'</span>);
expect(foo).<span class="hljs-keyword">to</span>.be.an.instanceof(Foo);

// include
expect([<span class="hljs-number">1</span>,<span class="hljs-number">2</span>,<span class="hljs-number">3</span>]).<span class="hljs-keyword">to</span>.include(<span class="hljs-number">2</span>);
expect(<span class="hljs-string">'foobar'</span>).<span class="hljs-keyword">to</span>.contain(<span class="hljs-string">'foo'</span>);
expect({ foo: <span class="hljs-string">'bar'</span>, hello: <span class="hljs-string">'universe'</span> }).<span class="hljs-keyword">to</span>.include.keys(<span class="hljs-string">'foo'</span>);

// <span class="hljs-keyword">empty</span>
expect([]).<span class="hljs-keyword">to</span>.be.<span class="hljs-keyword">empty</span>;
expect(<span class="hljs-string">''</span>).<span class="hljs-keyword">to</span>.be.<span class="hljs-keyword">empty</span>;
expect({}).<span class="hljs-keyword">to</span>.be.<span class="hljs-keyword">empty</span>;

// match
expect(<span class="hljs-string">'foobar'</span>).<span class="hljs-keyword">to</span>.match(/^foo/);
</code></pre>
