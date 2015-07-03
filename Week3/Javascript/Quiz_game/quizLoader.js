'use strict';
var read = require("read");
var User = require("./user.js");
var Quiz = require("./quiz.js");

var QuizLoader = function (user, quiz){
	this.user = user;
	this.quiz = quiz;
}

	// Read from keyboard
	var options = {
			prompt: "> "
	};

	QuizLoader.prototype.newOrLoad = function () {
		console.log("Say NEW to start a new game.\nSay LOAD to continue your last game.\nSay QUIT at any time to exit the game.");
		read(options, this.checkLoad.bind(this));
	}

	QuizLoader.prototype.checkLoad = function (err, input){
		if (err){
			throw err;
		}
		if(input.toUpperCase() === "NEW"){
			this.user.updateUser(0,0);
			var newQuiz = new Quiz(this.quiz.questions, this.user);
			newQuiz.startQuiz();

		}else if(input.toUpperCase() === "LOAD"){
			var newQuiz = new Quiz(this.quiz.questions, this.user);
			newQuiz.askQ();
		}else{
			this.newOrLoad();
		}
	}
	Quiz.prototype.loadQuiz = function (user){
		this.user = user;
		this.total = user.score;
		this.qID = user.currentQuestion;
		this.quiz.startQuiz();
	}
module.exports = QuizLoader;