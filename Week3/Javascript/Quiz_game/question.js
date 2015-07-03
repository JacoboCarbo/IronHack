'use strict';

var Question = function (id, q, answer) {
	this.qID = id;
	this.q = q;
	this.answer = answer;
	this.worth = 1;
}

	Question.prototype.printQ = function(){
		console.log("\nQ"+this.qID+": "+this.q+"\n");
	}

module.exports = Question;