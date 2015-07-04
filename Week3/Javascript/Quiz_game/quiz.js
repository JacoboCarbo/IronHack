'use strict';
var read = require("read");
var User = require("./user.js");

var Quiz = function (questions, memoryManager) {
	this.questions = questions;
	this.user = undefined;
	this.memoryManager = memoryManager;
}
	// Read from keyboard
	var options = {
			prompt: "> "
	};

	Quiz.prototype.login = function () {
		console.log("Type your name: ");
		read(options, this.createUser.bind(this));
	}

	Quiz.prototype.createUser = function (err, username) {
		this.user = new User(username);

		this.memoryManager.userLoader.loadFile(this.user, function(user){
			this.user = user;
			if (this.user.currentQuestion != 0){
				console.log("Welcome back "+this.user.name+"!");
			}else{
				console.log("Welcome "+this.user.name+"!");	
			}
			
			this.startQuiz();
		}.bind(this));

		
	}	

	Quiz.prototype.startQuiz = function (){
		if(this.user.currentQuestion === 0){
			this.bonusQ();
		}
		this.askQ();
	}

	Quiz.prototype.bonusQ = function () {
		var bonusIndex = Math.floor(Math.random()*this.questions.length);
		this.questions[bonusIndex].worth++;
	}

	Quiz.prototype.askQ = function (){
		this.printScore();
		this.questions[this.user.currentQuestion].printQ();
		read(options, this.checkAnswer.bind(this));
	}

	
	Quiz.prototype.nextQ = function (){
		this.user.currentQuestion++;
		if(this.user.currentQuestion >= this.questions.length){
			this.printScore();
		}else{
			this.askQ();
		}
		
	}

	Quiz.prototype.printScore = function (){
		console.log("\nYour score is: "+this.user.score +"/"+this.questions.length+"\n");
	}

	Quiz.prototype.checkAnswer = function (err, answer){
		if (err){
			throw err;

		} else if(answer.toUpperCase() === this.questions[this.user.currentQuestion].answer){
			this.user.score +=this.questions[this.user.currentQuestion].worth;
			if(this.questions[this.user.currentQuestion].worth>1){
				console.log("\nCongratulations! You got the bonus answer and earned double points!");
			}else{
				console.log("\nCorrect! You earned a point! ");
			}
			
			this.nextQ();

		}else if (answer.toUpperCase() === "QUIT"){
			this.printScore();
			console.log("Say SAVE to save your current game.\nSay QUIT again to exit the game.")
			read(options, this.endQuiz.bind(this));

		}else{
			this.user.score--;
			console.log("Wrong answer. You lost a point... Try again.\n");
			this.askQ();
		}
		
	}

	Quiz.prototype.endQuiz = function (err, input){
		if (err){
			throw err;
		}
		input = input.toUpperCase();
		if (input === "SAVE"){
			this.memoryManager.userSaver.saveUser(this.user);
		}
	}



module.exports = Quiz;

