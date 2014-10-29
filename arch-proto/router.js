
var http = require("http");
var url = require("url");

var transactions_server = function(){
    return {
        hostname: "127.0.0.1",
        port: "8081"
    };
};

var query_handler = function() {
    return {
        hostname: "127.0.0.1",
        port: "8082"
    };
};


var server = http.createServer(function(request, response){
    var path = url.parse(request.url);
    var req = undefined;
    
    console.log("Received request");

    //Actual routing...
    if(/^\/transaction/.exec(path.pathname)){
        req = transactions_server();
    }else if(/^\/query/.exec(path.pathname)){
        req = query_handler();
    }

    if(req){

        console.log("Proxying request:", req);

        req.headers = request.headers;
        req.method = request.method;
        req.path = request.url;
        var http_request = http.request(req);
        http_request.on('response', function(resp){
            resp.pipe(response);
        });

        http_request.pipe(request);
        http_request.end();
    }else{
        console.log("Request not eligible for proxy");

        response.writeHead(400, {
            'Content-Type': 'text/plain'
        });
        response.end("Requestpath not recognised");
    }
});

server.listen(8080, function(err){
    if(err) return console.log("ERROR", err);

    console.log("Server running. Listening on", server.address());
});
