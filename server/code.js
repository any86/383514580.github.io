var marked = require('marked');
marked.setOptions({
    highlight: function(code) {
        return require('highlight.js').highlightAuto(code).value;
    }
});
// var md = '```js\n console.log("hello"); \n console.log("second row")```';

var fs = require('fs');
var md = fs.readFileSync('README.md','utf8');
// console.log(md)

module.exports = function(md){
	return marked(md)
}
console.log(marked(md))
