'use strict';
var fs = require("fs");
var User = require("./user.js");

var UserLoader = function (){
	this.file = undefined;
	this.user = undefined;
}

	UserLoader.prototype.loadFile = function (user, callback){
		this.user = user;
		this.file = this.user.name + ".json";
		fs.exists(this.file, function(exists) {
			if (exists) {
				fs.readFile(this.file, 'utf8', function(err, file){
					this.user = JSON.parse(file);
					callback(this.user);
				}.bind(this));
			}else{
				callback(this.user);
			}
		}.bind(this));
	
	}

module.exports = UserLoader;
