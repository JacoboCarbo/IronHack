'use strict';
var gameLoader = require("./gameLoader.js");
var Quiz = require("./quiz.js");
var Question = require("./question.js");
var QuizLoader = require("./quizLoader.js");
var User = require("./user.js");

// Initialize Quizzzz
var user = new User();

var q1 = new Question(0,"Como me llamo?", "JACOBO");
var q2 = new Question(1,"Como se llama mi perro?", "KING KONG");
var q3 = new Question(2,"De donde soy?", "MADRID");
var questions = [q1, q2, q3];

var quiz = new Quiz(questions, user);

user.updateUser(5,2);
var quizLoader = new QuizLoader (user, quiz);
quizLoader.newOrLoad();
