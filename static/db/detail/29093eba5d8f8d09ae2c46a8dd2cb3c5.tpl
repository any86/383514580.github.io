<h1 id="vuex-">vuex的简单使用</h1>
<p><strong>[js/css]</strong> <strong>[ 2016-12-20 11:12:21]</strong></p>
<h2 id="-">本文适合读者</h2>
<p>可以使用vue-cli开发项目, 本文的例子都是基于他来写的, 但是如果只是了解概念那就无所谓了, 后续有时间我会写一个不依赖vue-cli的小例子.</p>
<h2 id="vuex-">vuex用来干什么的?</h2>
<p>对于vuex简单来说是把vue中<code>data</code>参数的数据结构<code>单独拿了出来</code>进行<code>管理</code></p>
<h2 id="-">为什么单独管理?</h2>
<p>当组件关系变得复杂的时候, 如果用prop或者内部的信息传播机制共享数据会使代码结构乱到难以维护, 所以vuex出现了, 使用前提建立在<code>复杂项目</code>下, 如果项目内部的组件很少请不要使用vuex, 因为用vuex会有增加代码量(需要写出State, Mutations, Action等代码结构);</p>
<h2 id="-">写一个小例子前的准备工作</h2>
<p>.首先, 建立一个store.js文件, 放在和入口main.js同级, 这就可以把store想成vuex的一个实例好了(个人方法, 并非正确); store里面有State, Mutations, Action等代码结构.</p>
<p><code>store.js</code></p>
<pre><code class="lang-javascript"><span class="hljs-comment">// 引入 vuex</span>
<span class="hljs-keyword">import</span> Vue <span class="hljs-keyword">from</span> <span class="hljs-string">'vue'</span>
<span class="hljs-keyword">import</span> Vuex <span class="hljs-keyword">from</span> <span class="hljs-string">'vuex'</span>
Vue.use(Vuex);
<span class="hljs-keyword">export</span> <span class="hljs-keyword">default</span> <span class="hljs-keyword">new</span> Vuex.Store({
    <span class="hljs-comment">// State, Mutations, Action等代码结构</span>
});
</code></pre>
<p><code>main.js</code>:</p>
<pre><code class="lang-javascript"><span class="hljs-comment">// 引入 store</span>
<span class="hljs-keyword">import</span> Vue <span class="hljs-keyword">from</span> <span class="hljs-string">'vue'</span>
<span class="hljs-keyword">import</span> App <span class="hljs-keyword">from</span> <span class="hljs-string">'./App'</span>
<span class="hljs-keyword">import</span> store <span class="hljs-keyword">from</span> <span class="hljs-string">'./store'</span>

<span class="hljs-keyword">new</span> Vue({
    store, <span class="hljs-comment">// 注入store</span>
    el: <span class="hljs-string">'#app'</span>,
    template: <span class="hljs-string">'&lt;App/&gt;'</span>,
    components: { App }
});
</code></pre>
<h2 id="-">写个最简单的例子</h2>
<p><code>store.js</code></p>
<pre><code class="lang-javascript">const store = new Vuex.Store({
  <span class="hljs-keyword">state</span>: {
    count: <span class="hljs-number">1</span>
  },
  mutations: {
    incrementSync (<span class="hljs-keyword">state</span>) {
      <span class="hljs-keyword">state</span>.count++
    }
  },
  actions: {
      resetAsyn (context) {
           <span class="hljs-built_in">set</span>Timeout(()=&gt;{
               .commit('incrementSync', <span class="hljs-number">0</span>);
           }, <span class="hljs-number">1000</span>);
      }
});
</code></pre>
<h2 id="state">State</h2>
<p>可以类比原来vue中的data参数; 这些数据放在这主要是为了多组件共享.
声明state.</p>
<p>组件内读取: </p>
<pre><code class="lang-javascript">this.<span class="hljs-variable">$store</span>.<span class="hljs-keyword">state</span>.count;
</code></pre>
<p>组件内设置
<code>不可以直接操作state, 同步操作用mutation, 异步用action</code></p>
<h2 id="mutation">Mutation</h2>
<p>对state的数据的变更操作都需要通过mutation来操作
组件内调用
this.$store.commit(&#39;incrementSync&#39;);</p>
<h2 id="action">Action</h2>
<p>对于异步获取的数据用action来包装, 然后通过调用mutation来修改state
组件内调用
this.$store.dispatch(&#39;resetAsyn&#39;);</p>
<h2 id="-">总之</h2>
<p>总之vuex的出现是为了在组件数量很多,数据共享复杂的情况下的一种组件间数据共享的解决方案, 或者叫逻辑规范.</p>
