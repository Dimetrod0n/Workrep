var http = require("http");

var server = http.createServer(function(request, response) {

    response.end("It is working");

});

var port = process.env.PORT || 1338;
server.listen(port);

console.log("Server running at http://localhost:%d", port);
