'use strict';

var MemoryManager = function (userloader, usersaver){
	this.userLoader = userloader;
	this.userSaver = usersaver;
}

module.exports = MemoryManager;