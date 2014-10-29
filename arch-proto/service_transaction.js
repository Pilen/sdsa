
var http = require("http");

http.createServer(function(req, resp){

    console.log("Received request");

    resp.writeHead(200, { 'Content-Type': 'text/plain' });
    resp.end("Hello world - transactions");
}).listen(8081, function(err){
    if(err) return console.log("ERROR", err);

    console.log("Server running.", this.address());
});
