var marked = require('marked');
marked.setOptions({
    highlight: function(code) {
        return require('highlight.js').highlightAuto(code).value;
    }
});

var fs = require('fs')
var md = '```js\n console.log("hello"); \n console.log("second row")```';
var md = fs.readFileSync('./md/1/1.desc.md', 'utf-8');
console.log(marked(md));

module.exports = function(md){
	return marked(md);
}

