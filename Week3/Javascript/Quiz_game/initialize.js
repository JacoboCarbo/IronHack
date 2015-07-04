'use strict';
var MemoryManager = require("./memoryManager.js");
var Userloader = require("./Userloader.js");
var userSaver = require("./userSaver.js");
var Quiz = require("./quiz.js");
var Question = require("./question.js");
var User = require("./user.js");

// Initialize Quizzzz


var q1 = new Question(0,"Como me llamo?", "JACOBO");
var q2 = new Question(1,"Como se llama mi perro?", "KING KONG");
var q3 = new Question(2,"De donde soy?", "MADRID");
var questions = [q1, q2, q3];

var memoryManager = new MemoryManager(new Userloader(), new userSaver());
var quiz = new Quiz(questions, memoryManager);
quiz.login();

