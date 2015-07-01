"use strict";

var fs = require("fs");
var fileActions = require("./fileActions.js");

function episodeLoader (file){
	fs.readFile(file, 'utf8', fileActions);
}

module.exports = episodeLoader;
