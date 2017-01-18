import Vue from 'vue'
import Vuex from 'vuex'
import superagent from 'superagent'
Vue.use(Vuex);
export default new Vuex.Store({
    state: {
        index_pos_y: 0,
        top_bar: {
            show: false
        },
        page: 1,
        count: 0,
        list: [],
        list_loader: true,
        page_total: 1,
        page: 1,
        page_each: 3,
        detail: {},
        detail_loader: true
    },
    mutations: {
        // 存储列表页滚动条高度, 方便其他页面返回继续当前位置
        setIndexPosY(state, y) {
            state.index_pos_y = y;
        },

        isListPosTop(state, bool) {
            state.top_bar.show = bool;
        },

        setList(state, json) {
            state.list = json;
        },

        setListLoader(state, bool) {
            state.list_loader = bool;
        },

        setPageTotal(state, count) {
            state.page_total = count;
        },

        setPage(state, number) {
            state.page = number;
        },

        setDetail(state, data) {
            state.detail = data;
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
                superagent.get('https://383514580.github.io/static/db/list.json')
                    .set('Accept', 'application/json')
                    .end(function(err, res) {
                        if (err) {
                            alert(err);
                        } else {
                            context.commit('setList', res.body);
                            resolve();
                        }

                    });
            });

        },
        /*
         * 获取详情
         */
        getDetail(context, id) {
            return new Promise((resolve, reject) => {
                superagent.get('https://383514580.github.io/static/db/detail/' + id + '.tpl')
                    .end(function(err, res) {
                        if (err) {
                            alert(err);
                        } else {
                            context.commit('setDetailLoader', false);
                            context.commit('setDetail', res.text);
                            resolve();
                        }
                    });
            });
        }
    }
});
