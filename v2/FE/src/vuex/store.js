import Vue from 'vue'
import Vuex from 'vuex'
import superagent from 'superagent'
Vue.use(Vuex);
export default new Vuex.Store({
    state: {
        page: 1,
        count: 0,
        list: [],
        list_info: '',
        list_status: 1,
        list_loader: true,
        detail: {},
        detail_info: '',
        detail_status: 1,
        detail_loader: true
    },
    mutations: {
        getList(state, json) {
            if (1 == json.status) {
                json.data.list.forEach(item => {
                    // 正则的改
                    item.desc = item.desc.replace(/<pre><code>[\S|\s]*<\/code><\/pre>/g, function(str) {
                        var code_str = str.replace('<pre><code>', '')
                        code_str = code_str.replace('</code></pre>', '');
                        str = hljs.highlightAuto(code_str).value;
                        return '<pre class="hljs"><code>' + str + '</code></pre>';
                    });
                    state.list.push(item);

                });
                state.list_status = 1;
                state.list_info = '';
                state.list_loader = false;
            } else {
                state.list_status = json.status;
                state.list_info = json.info;
                state.list_loader = true;
            }
        },
        setListLoader(state, bool) {
            state.list_loader = bool;
        },
        setListStatus(state, status) {
            state.list_status = status;
        },
        getDetail(state, data) {
            data.desc = data.desc.replace(/<pre><code>[\S|\s]*<\/code><\/pre>/g, function(str) {
                var code_str = str.replace('<pre><code>', '')
                code_str = code_str.replace('</code></pre>', '');
                str = hljs.highlightAuto(code_str).value;
                return '<pre class="hljs"><code>' + str + '</code></pre>';
            });
            state.detail = data
        },
        setDetailLoader(state, bool) {
            state.detail_loader = bool;
        },
        setDetailStatus(state, status) {
            state.detail_status = status;
        }
    },
    actions: {
        getList(context, page) {
            // context可能是store也可能是module
            // context.commit('setListLoader', true);
            superagent.get('/mock/list')
                .set('Accept', 'application/json')
                .query({ page: page, limit: 5 })
                .end(function(err, res) {
                    context.commit('getList', res.body);
                });
        },
        getDetail(context, id) {
            superagent.get('/mock/detail')
                .set('Accept', 'application/json')
                .query({ id: id })
                .end(function(err, res) {
                    context.commit('setDetailLoader', false);
                    context.commit('getDetail', res.body.data);
                });
        }
    }
});
