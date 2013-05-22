var http = require('http');

http.createServer(function(req, res){
	res.writeHead(200, {'Content-Type': 'text/html'});
	res.write('<h1>Hello</h1><h2>my test</h2>');
	res.end('<p>Hello World</p>');
}).listen(3000);
console.log("HTTP server is listening at port 3000.");
