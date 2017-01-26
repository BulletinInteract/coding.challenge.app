'use strict';

var express = require('express');
var config = require('config');
var app = express();

app.get('/', function(req, res) {
 res.send('Hello World! ' + config.what + '.');
})

app.listen(config.port, function() {
 console.log('Example app listening on port ' + config.port + '!')
});
