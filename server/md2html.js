var marked = require('marked');
marked.setOptions({
    highlight: function(code) {
        return require('highlight.js').highlightAuto(code).value;
    }
});

var md = '@time';
var tokens = marked(md);
console.log(tokens)


// var md = '```js\n console.log("hello"); \n console.log("second row")```';
module.exports = function(md){
	return marked(md)
}

