<h1 id="-">浏览器缓存与头信息</h1>
<p><strong>[html]</strong>   <strong>[2016-12-24 12:12:21]</strong></p>
<h2 id="-">待续</h2>
<p>　　HTML的HTTP协议头信息中控制着页面在几个地方的缓存信息，包括浏览器端，中间缓存服务器端(如：squid等)，Web服务器端。本文讨论头信息 中带缓存控制信息的HTML页面(JSP/Servlet生成好出来的也是HTML页面)在中间缓存服务器中的缓存情况。</p>
<pre><code>  HTTP协议中关于缓存的信息头关键字包括<span class="hljs-keyword">Cache</span>-Control(HTTP1<span class="hljs-number">.1</span>)，<span class="hljs-keyword">Pragma</span>(HTTP1<span class="hljs-number">.0</span>)，<span class="hljs-keyword">last</span>-Modified，Expires等。

  HTTP1<span class="hljs-number">.0</span>中通过<span class="hljs-keyword">Pragma</span> 控制页面缓存，可以设置：<span class="hljs-keyword">Pragma</span>或<span class="hljs-keyword">no</span>-<span class="hljs-keyword">cache</span>。网上有非常多的文章说明如何控制不让浏览器或中间缓存服务器缓存页面，通常设置的值为<span class="hljs-keyword">no</span>- <span class="hljs-keyword">cache</span>，不过这个值不这么保险，通常还加上Expires置为<span class="hljs-number">0</span>来达到目的。但是如我们刻意需要浏览器或缓存服务器缓存住我们的页面这个值则要设置为 <span class="hljs-keyword">Pragma</span>。

  HTTP1<span class="hljs-number">.1</span>中启用<span class="hljs-keyword">Cache</span>-Control 来控制页面的缓存与否，这里介绍几个常用的参数：
</code></pre><p>no-cache，浏览器和缓存服务器都不应该缓存页面信息；
public，浏览器和缓存服务器都可以缓存页面信息；
no-store，请求和响应的信息都不应该被存储在对方的磁盘系统中；
must-revalidate，对于客户机的每次请求，代理服务器必须想服务器验证缓存是否过时；
       Last-Modified只页面的最后生成时间，GMT格式；</p>
<pre><code>   Expires过时期限值，GMT格式，指浏览器或缓存服务器在该时间点后必须从真正的服务器中获取新的页面信息；

   上面两个值在JSP中设置值为字符型的GMT格式，无法生效，设置<span class="hljs-keyword">long</span>类型才生效；
</code></pre>