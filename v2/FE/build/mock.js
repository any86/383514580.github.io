module.exports = function(express, app) {
    // 使用 Mock
    var Mock = require('mockjs');
    var bodyParser = require('body-parser')


    /*
     * 表格数据(table)
     */
    app.get('/mock/list', function(req, res) {
        // 生成limit条数据
        var limit = req.query.limit;
        var mock_config = { 'status': 1, 'data': { 'count': 100, 'list': [] } };

        mock_config.data['list|' + limit] = [{
            'id|+1': 1,
            'title': '@ctitle(7,25)',
            'desc': '@cword(10, 50)<pre><code>function (){return f()}();\r\nalert(123); \r\nvar a = 123;</code></pre>',
            'create_time': '@datetime(\'yyyy-MM-dd HH:mm:ss\')',
            'category': '@cword(3,5)'
        }];

        if (3 > req.query.page) {
            // setTimeout(function() {
            var data = Mock.mock(mock_config);
            res.json(data);
            // }, 2000);
        } else {
            var data = {
                status: 0,
                info: '无数据!'
            }
            res.json(data);
        }
    });

    /*
     * 详情数据(detail)
     */
    app.get('/mock/detail', function(req, res) {
        var id = req.query.id;
        if(3 > id) {
            var mock_config = { 'status': 1, 'data': {}};
            mock_config.data = {
                'id': id,
                'title': '@ctitle(3,5)',
                'desc': '@cword(10, 500)<pre><code>function (){return f()}();\r\nalert(123); \r\nvar a = 123;</code></pre>@cword(10, 500)',
                'create_time': '@datetime(\'yyyy-MM-dd HH:mm:ss\')',
                'category': '@cword(3,5)'
            };
            var data = Mock.mock(mock_config);            
        } else {
            var data = {status: 0, info: '无数据!'}
        }
        setTimeout(()=>{
            res.json(data);
        }, 1000);
        
    });

    /*
     * 伪装post请求
     */
    // 解析req.body
    app.use(bodyParser.json()); // for parsing application/json
    app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
    app.post('/mock/post', function(req, res) {
        var seed = Math.floor(Math.random() * 10);
        var id = req.body.id || seed;
        if (0 == id % 2) {
            var status = 1;
            var info = '操作成功!:' + id;
            if (8 <= seed) {
                var data = {
                    status: status,
                    data: { "url": "http://so.com" }
                };
            } else {
                var data = {
                    status: status,
                    info: info
                };
            }
        } else {
            var data = {
                status: 0,
                info: '操作失败!:' + id
            };
        }

        var json = JSON.stringify(data, null, 4);
        // 返回数据
        // setTimeout(function() {
        res.send(json);
        // }, 1000);
    });

    app.post('/mock/success', function(req, res) {
        var data = {
            "status": 1,
            "info": "成功！"
        };
        var json = JSON.stringify(data, null, 4);
        res.send(json);
    });

    app.post('/mock/error', function(req, res) {
        var data = {
            "status": 0,
            "info": "失败！"
        };
        var json = JSON.stringify(data, null, 4);
        res.send(json);
    });

    console.log('Mock数据初始化完成！');
}
