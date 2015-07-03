'use strict';

var User = function (){
	this.name = "Jacobo";
	this.score = 0;
	this.currentQuestion = 0;
}

	User.prototype.updateUser = function (newScore, currentQuestion) {
		this.score = newScore;
		this.currentQuestion = currentQuestion;
	}

module.exports = User;