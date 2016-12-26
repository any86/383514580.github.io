var fs = require('fs');
var crypto = require('crypto');
var md2html = require('./md2html.js');
var DIR_PATH = 'my_doc/';
var DESC_DIR = '../v2/FE/static/db/';
var files_name = fs.readdirSync(DIR_PATH);

var list = [];

files_name.forEach(file_name=> {
	if(-1 < file_name.search(/.*\.md/)) {
		// 打开md文件
		var md = fs.readFileSync(DIR_PATH + file_name, 'utf8');

		// \s 非空格符
		// (.+) 非换行至少1次
		// [^.] 非非换行符 = 换行符
		// \*\*\[(.+)\]\*\* '**'中间内容
		var match = md.match(/#\s*(.+)[^.]*\*\*\[(.+)\]\*\*\s*\*\*\[(.+)\]\*\*/);
		var id = crypto.createHash('md5').update(md).digest('hex');
		// 构造列表项对象
		var obj = {
			id: id,
			title: match[1],
			// category: match[2].split('/'),
			category: match[2],
			time: match[3]
		}

		// 匹配第一段为列表描述
		// var match = md.match(/(##[^#\r\n]*)/); // 带##标题
		var match = md.match(/##.*[\r\n]*([^#]*)/);
		// console.log(match)

		obj.desc = md2html(match[1]);

		// 填充列表数据
		list.push(obj);


		// ================================ 详情模版 ================================
		var md = fs.readFileSync(DIR_PATH + file_name, 'utf8');
		var html = md2html(md);

		if(!fs.existsSync(DESC_DIR + 'detail/')) {
			fs.mkdirSync(DESC_DIR + 'detail/');
		}

		fs.writeFileSync(DESC_DIR + 'detail/' + id+'.tpl', html);		

	}
});

// 列表json
fs.writeFileSync(DESC_DIR + 'list.json', JSON.stringify(list, null, 4));