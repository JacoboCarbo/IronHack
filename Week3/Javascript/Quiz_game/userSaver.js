'use strict';
var fs = require("fs");

var UserSaver = function (){
	this.file = undefined;
	this.user = undefined;
}

	UserSaver.prototype.saveUser = function (user){
		this.user = user;
		this.file = this.user.name + ".json";
		fs.writeFile(this.file, JSON.stringify(this.user), this.fileSaved);
	}

	UserSaver.prototype.fileSaved = function (err, file){
		console.log("Your session has been saved.");
	}

module.exports = UserSaver;