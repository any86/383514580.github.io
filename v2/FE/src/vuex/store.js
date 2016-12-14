import Vue from 'vue'
import Vuex from 'vuex'
import superagent from 'superagent'
Vue.use(Vuex);
export default new Vuex.Store({
    state: {
        page: 1,
        count: 0,
        list: [],
        list_loader: true,
        detail: {},
        detail_info: '',
        detail_status: 1,
        detail_loader: true
    },
    mutations: {
        setList(state, json) {
            state.list = json;
        },
        setListLoader(state, bool) {
            state.list_loader = bool;
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
            return new Promise((resolve, reject) => {
                superagent.get('/mock/list')
                    .set('Accept', 'application/json')
                    .query({ page: 1, limit: 20 })
                    .end(function(err, res) {
                        context.commit('setList', res.body.data.list);
                        resolve();
                    });                
            })

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
