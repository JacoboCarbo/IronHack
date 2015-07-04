'use strict';

var User = function (name){
	this.name = name;
	this.score = 0;
	this.currentQuestion = 0;
}

	User.prototype.setName = function (username){
		this.name = username;
	}

	User.prototype.updateUser = function (newScore, currentQuestion) {
		this.score = newScore;
		this.currentQuestion = currentQuestion;
	}
	
module.exports = User;
