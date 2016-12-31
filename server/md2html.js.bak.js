var marked = require('marked');
marked.setOptions({
    highlight: function(code) {
        return require('highlight.js').highlightAuto(code).value;
    }
});
module.exports = function(md){
	return marked(md);
}

