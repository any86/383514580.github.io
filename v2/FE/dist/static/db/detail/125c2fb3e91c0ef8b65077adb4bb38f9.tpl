<h1 id="-">深入探究浏览器的窗口尺寸</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<p>##定义W3C的标准，则  </p>
<h3 id="ie-">IE中：</h3>
<pre><code class="lang-javascript```">document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// BODY对象宽度  </span>
document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// BODY对象高度  </span>
document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 可见区域宽度    </span>
document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 可见区域高度</span>
</code></pre>
<p>###FireFox中：  </p>
<pre><code class="lang-javascript```">document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// BODY对象宽度   </span>
document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// BODY对象高度   </span>
document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 可见区域宽度    </span>
document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 可见区域高度</span>
</code></pre>
<p>###Opera中：  </p>
<pre><code class="lang-javascript```">document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 可见区域宽度   </span>

document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 可见区域高度   </span>

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 页面对象宽度（即BODY对象宽度加上Margin宽）    </span>

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 页面对象高度（即BODY对象高度加上Margin高）</span>
</code></pre>
<p>没有定义W3C的标准，则   </p>
<pre><code class="lang-javascript```">###IE为：   

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 0    </span>

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 0</span>
</code></pre>
<p>###FireFox为：  </p>
<pre><code class="lang-javascript```">document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 页面对象宽度（即BODY对象宽度加上Margin宽)    </span>

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 页面对象高度（即BODY对象高度加上Margin高）</span>
</code></pre>
<p>###Opera为：   </p>
<pre><code class="lang-javascript```">document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientWidth</span> <span class="hljs-comment">// 页面对象宽度（即BODY对象宽度加上Margin宽）   </span>

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.clientHeight</span> <span class="hljs-comment">// 页面对象高度（即BODY对象高度加上Margin高）    </span>

网页可见区域宽： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientWidth</span>   

网页可见区域高： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.clientHeight</span>    

网页可见区域宽： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.offsetWidth</span> (包括边线的宽)   

网页可见区域高： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.offsetHeight</span> (包括边线的高)    

网页正文全文宽： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.scrollWidth</span>    

网页正文全文高： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.scrollHeight</span>    

网页被卷去的高： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.scrollTop</span>   

网页被卷去的左： document<span class="hljs-selector-class">.body</span><span class="hljs-selector-class">.scrollLeft</span>    

网页正文部分上： window<span class="hljs-selector-class">.screenTop</span>    

网页正文部分左： window<span class="hljs-selector-class">.screenLeft</span>    

屏幕分辨率的高： window<span class="hljs-selector-class">.screen</span><span class="hljs-selector-class">.height</span>    

屏幕分辨率的宽： window<span class="hljs-selector-class">.screen</span><span class="hljs-selector-class">.width</span>    

屏幕可用工作区高度： window<span class="hljs-selector-class">.screen</span><span class="hljs-selector-class">.availHeight</span>     

屏幕可用工作区宽度： window<span class="hljs-selector-class">.screen</span><span class="hljs-selector-class">.availWidth</span>    

HTML精确定位:scrollLeft,scrollWidth,clientWidth,offsetWidth   

scrollHeight: 获取对象的滚动高度。   

scrollLeft:设置或获取位于对象左边界和窗口中目前可见内容的最左端之间的距离    

scrollTop:设置或获取位于对象最顶端和窗口中可见内容的最顶端之间的距离    

scrollWidth:获取对象的滚动宽度    

offsetHeight:获取对象相对于版面或由父坐标 offsetParent 属性指定的父坐标的高度     

offsetLeft:获取对象相对于版面或由 offsetParent 属性指定的父坐标的计算左侧位置     

offsetTop:获取对象相对于版面或由 offsetTop 属性指定的父坐标的计算顶端位置     

event<span class="hljs-selector-class">.clientX</span> 相对文档的水平座标    

event<span class="hljs-selector-class">.clientY</span> 相对文档的垂直座标     

event<span class="hljs-selector-class">.offsetX</span> 相对容器的水平坐标    

event<span class="hljs-selector-class">.offsetY</span> 相对容器的垂直坐标    

document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.scrollTop</span> 垂直方向滚动的值    

event.clientX+document<span class="hljs-selector-class">.documentElement</span><span class="hljs-selector-class">.scrollTop</span> 相对文档的水平座标+垂直方向滚动的量
</code></pre>
