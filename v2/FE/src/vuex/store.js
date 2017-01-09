import Vue from 'vue'
import Vuex from 'vuex'
import superagent from 'superagent'
Vue.use(Vuex);
export default new Vuex.Store({
    state: {
        index_pos_y: 0,
        list: [],
        detail: {},
        detail_loader: true
    },
    mutations: {
        // 存储列表页滚动条高度, 方便其他页面返回继续当前位置
        setIndexPosY(state, y) {
            state.index_pos_y = y;
        },

        // 我的名片的高度
        set_card_height(state, h) {
            state.card_height = h;
        },

        setList(state, json) {
            state.list = json;
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
