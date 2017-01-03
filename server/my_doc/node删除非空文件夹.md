# node删除非空文件夹
**[nodejs]**   **[2016-12-24 12:12:21]**

## 代码
```javascript
function rmdirSync2(dir) {
    files = fs.readdirSync(dir);
    files.forEach(file=>{
    	if(fs.statSync(dir + file).isDirectory()){
    		// 文件夹
    		rmdirSync2(dir + file + '/');
    	} else {
    		// 文件
    		fs.unlinkSync(dir + file);
    	}
    });
    fs.rmdirSync(dir);
}
rmdirSync2(DESC_DIR);
```