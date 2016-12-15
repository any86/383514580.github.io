var fs = require('fs');
var DIR_PATH = './md/';
var dirs = fs.readdirSync(DIR_PATH);
var md2html = require('./md2html.js');
var DESC_DIR = './db/';

var json_list = [];
dirs.forEach(dir_name=>{
	var dir = DIR_PATH + dir_name + '/';

	// 列表desc
	var desc_md = fs.readFileSync(dir + dir_name + '.desc.md', 'utf8');
	var desc_html = md2html(desc_md);
	// console.log(desc_html.replace(/\n\r/g, ''));

	// 列表json中一行
	var json_str = fs.readFileSync(dir + dir_name + '.json', 'utf8');
	var json_obj = JSON.parse(json_str);
	json_obj.id = dir_name;
	json_obj.desc = desc_html;
	json_list.push(json_obj);

	// 详情模版
	var md = fs.readFileSync(dir + dir_name + '.md', 'utf8');
	var html = md2html(md);

	if(!fs.existsSync(DESC_DIR + 'detail/')) {
		fs.mkdirSync(DESC_DIR + 'detail/');
	}
	
	fs.writeFileSync(DESC_DIR + 'detail/' + dir_name+'.tpl', html);
});

// 列表json
fs.writeFileSync(DESC_DIR + 'list.json', JSON.stringify(json_list));
console.log(json_list);


