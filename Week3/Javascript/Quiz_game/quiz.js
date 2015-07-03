'use strict';
var read = require("read");
// var QuizLoader = require("./quizLoader.ls");
// var QuizSaver = require("./quizSaver.ls");

var Quiz = function (questions, user) {
	this.questions = questions;
	this.user = user;
}
	// Read from keyboard
	var options = {
			prompt: "> "
	};

	// Quiz.prototype.Login
	Quiz.prototype.startQuiz = function (){
		this.bonusQ();
		this.askQ();
	}

	Quiz.prototype.printScore = function (){
		console.log("\nYou score is: "+this.user.score +"/"+this.questions.length+"\n");
	}

	Quiz.prototype.endQuiz = function (err, input){
		if (err){
			throw err;
		}
		input = input.toUpperCase();
		if (input === "SAVE"){

		}
	}

	Quiz.prototype.askQ = function (){
		this.printScore();
		this.questions[this.user.currentQuestion].printQ();
		read(options, this.checkAnswer.bind(this));
	}


	Quiz.prototype.checkAnswer = function (err, answer){
		if (err){
			throw err;
		}
		else if (answer.toUpperCase() === "QUIT"){
			this.printScore();
			console.log("Say SAVE to save your current game.\nSay QUIT again to exit the game.")
			read(options, this.endQuiz.bind(this));
		}
		else if(answer.toUpperCase() === this.questions[this.user.currentQuestion].answer){
			this.user.score +=this.questions[this.user.currentQuestion].worth;
			if(this.questions[this.user.currentQuestion].worth>1){
				console.log("\nCongratulations! You got the bonus answer and earned double points!");
			}else{
				console.log("\nCorrect! You earned a point! ");
			}
			
			this.nextQ();
		}
		else{
			this.user.score--;
			console.log("Wrong answer. You lost a point... Try again.\n");
			this.askQ();
		}
		
	}

	Quiz.prototype.nextQ = function (){
		this.user.currentQuestion++;
		if(this.user.currentQuestion >= this.questions.length){
			this.printScore();
		}else{
			this.askQ();
		}
		
	}

	Quiz.prototype.bonusQ = function () {
		var bonusIndex = Math.floor(Math.random()*this.questions.length);
		console.log("\n\n\nBONUS INDEX: "+bonusIndex+"\n\n\n");
		this.questions[bonusIndex].worth++;
	}


module.exports = Quiz;

