<h1 id="-">手机页面的适配应该怎么做?</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">为什么适配?</h2>
<p>手机设备的分辨率不统一,要做到没个设备上的效果和设计图比例一致,就需要进行适配.</p>
<h2 id="-rem">尺寸单位rem</h2>
<p>rem是一种相对单位, 在html中设置了font-size, 那么后续如果使用rem表示尺寸, 这个尺寸就是html中的font-szie大小的倍数. </p>
<h2 id="-">准备</h2>
<p>基于rem的特点我们就很好做各个分辨率的适配了, 只要我们在不同分辨率下设置不同的html的font-size属性就实现响应设计.</p>
<pre><code class="lang-css```"><span class="hljs-selector-tag">html</span> { <span class="hljs-attribute">font-size</span>: <span class="hljs-number">100px</span>;}
@<span class="hljs-keyword">media</span> screen and (max-width:<span class="hljs-number">769px</span>) {
    <span class="hljs-selector-tag">html</span> { <span class="hljs-attribute">font-size</span>: <span class="hljs-number">100px</span>; }
}
@<span class="hljs-keyword">media</span> screen and (max-width:<span class="hljs-number">415px</span>) {
    <span class="hljs-selector-tag">html</span> { <span class="hljs-attribute">font-size</span>: <span class="hljs-number">100px</span>; }
}
@<span class="hljs-keyword">media</span> screen and (max-width:<span class="hljs-number">376px</span>) {
    <span class="hljs-selector-tag">html</span> { <span class="hljs-attribute">font-size</span>: <span class="hljs-number">91px</span>; }
}
@<span class="hljs-keyword">media</span> screen and (max-width:<span class="hljs-number">321px</span>) {
    <span class="hljs-selector-tag">html</span> { <span class="hljs-attribute">font-size</span>: <span class="hljs-number">77px</span>; }
}
</code></pre>
<h2 id="-">如何使用上面的准备</h2>
<p>比如我们有个有个图片尺寸在</p>
<h2 id="-100px-91px-">上面的100px 91px .. 是怎么来的?</h2>
<h3 id="-">设计图</h3>
<p>有了上述的css, 我们就可以基于某个特定的手机分辨率进行<strong>缩放计算</strong>
比如我们假设把iphone6p作为基准, 那么我们的设计图的尺寸也必须为iphone6p的倍数.</p>
<h3 id="css">css</h3>
<p>设置屏幕分辨率为小于415px大于375px的情况下html下的font-size为100px; 那么可以推导出ip6的html应该设置font-size为100 * (375 / 414),约等于91px, 同理写出其他需要适配的条件.</p>
