<h1 id="-">深入探究浏览器的窗口尺寸</h1>
<p><strong>[js/css]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<p>###IE中： </p>
<p>document.body.clientWidth ==&gt; BODY对象宽度  </p>
<p>document.body.clientHeight ==&gt; BODY对象高度  </p>
<p>document.documentElement.clientWidth ==&gt; 可见区域宽度    </p>
<p>document.documentElement.clientHeight ==&gt; 可见区域高度   </p>
<p>###FireFox中：  </p>
<p>document.body.clientWidth ==&gt; BODY对象宽度   </p>
<p>document.body.clientHeight ==&gt; BODY对象高度   </p>
<p>document.documentElement.clientWidth ==&gt; 可见区域宽度    </p>
<p>document.documentElement.clientHeight ==&gt; 可见区域高度       </p>
<p>###Opera中：  </p>
<p>document.body.clientWidth ==&gt; 可见区域宽度   </p>
<p>document.body.clientHeight ==&gt; 可见区域高度   </p>
<p>document.documentElement.clientWidth ==&gt; 页面对象宽度（即BODY对象宽度加上Margin宽）    </p>
<p>document.documentElement.clientHeight ==&gt; 页面对象高度（即BODY对象高度加上Margin高）    </p>
<hr>
<p>没有定义W3C的标准，则   </p>
<p>###IE为：   </p>
<p>document.documentElement.clientWidth ==&gt; 0    </p>
<p>document.documentElement.clientHeight ==&gt; 0   </p>
<p>###FireFox为：  </p>
<p>document.documentElement.clientWidth ==&gt; 页面对象宽度（即BODY对象宽度加上Margin宽)    </p>
<p>document.documentElement.clientHeight ==&gt; 页面对象高度（即BODY对象高度加上Margin高）   </p>
<p>###Opera为：   </p>
<p>document.documentElement.clientWidth ==&gt; 页面对象宽度（即BODY对象宽度加上Margin宽）   </p>
<p>document.documentElement.clientHeight ==&gt; 页面对象高度（即BODY对象高度加上Margin高）    </p>
<p>网页可见区域宽： document.body.clientWidth   </p>
<p>网页可见区域高： document.body.clientHeight    </p>
<p>网页可见区域宽： document.body.offsetWidth (包括边线的宽)   </p>
<p>网页可见区域高： document.body.offsetHeight (包括边线的高)    </p>
<p>网页正文全文宽： document.body.scrollWidth    </p>
<p>网页正文全文高： document.body.scrollHeight    </p>
<p>网页被卷去的高： document.body.scrollTop   </p>
<p>网页被卷去的左： document.body.scrollLeft    </p>
<p>网页正文部分上： window.screenTop    </p>
<p>网页正文部分左： window.screenLeft    </p>
<p>屏幕分辨率的高： window.screen.height    </p>
<p>屏幕分辨率的宽： window.screen.width    </p>
<p>屏幕可用工作区高度： window.screen.availHeight     </p>
<p>屏幕可用工作区宽度： window.screen.availWidth    </p>
<p>HTML精确定位:scrollLeft,scrollWidth,clientWidth,offsetWidth   </p>
<p>scrollHeight: 获取对象的滚动高度。   </p>
<p>scrollLeft:设置或获取位于对象左边界和窗口中目前可见内容的最左端之间的距离    </p>
<p>scrollTop:设置或获取位于对象最顶端和窗口中可见内容的最顶端之间的距离    </p>
<p>scrollWidth:获取对象的滚动宽度    </p>
<p>offsetHeight:获取对象相对于版面或由父坐标 offsetParent 属性指定的父坐标的高度     </p>
<p>offsetLeft:获取对象相对于版面或由 offsetParent 属性指定的父坐标的计算左侧位置     </p>
<p>offsetTop:获取对象相对于版面或由 offsetTop 属性指定的父坐标的计算顶端位置     </p>
<p>event.clientX 相对文档的水平座标    </p>
<p>event.clientY 相对文档的垂直座标     </p>
<p>event.offsetX 相对容器的水平坐标    </p>
<p>event.offsetY 相对容器的垂直坐标    </p>
<p>document.documentElement.scrollTop 垂直方向滚动的值    </p>
<p>event.clientX+document.documentElement.scrollTop 相对文档的水平座标+垂直方向滚动的量 </p>
