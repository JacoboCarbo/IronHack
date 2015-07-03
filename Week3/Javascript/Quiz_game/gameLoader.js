"use strict";

var fs = require("fs");
var fileActions = require("./fileActions.js");

function gameLoader (file){
	fs.readFile(file, 'utf8', fileActions);
}

module.exports = gameLoader;
