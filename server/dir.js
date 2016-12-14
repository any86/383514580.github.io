var fs = require('fs');
var DIR_PATH = './md/';
var list = fs.readdirSync(DIR_PATH);
var md2html = require('./md2html.js');

list.forEach(file_name=>{
	var md = fs.readFileSync(DIR_PATH + file_name,'utf8');
	var html = md2html(md);
	// console.log(html)
	fs.writeFileSync(file_name+'.html', html);
});


