'use strict';
var Inventory = require('./inventory.js');

//Room:

var Room = function (description, hint, actions) {
	this.description = description;
	this.hint = hint;
	this.neighbors = undefined;
	this.inventory = new Inventory();
	this.actions = actions;
}

	Room.prototype.mapNeighbors = function(neighbors){
		this.neighbors = neighbors;
	}

	Room.prototype.printRoomInfo = function () {
		console.log("\nAvailable directions: " + Object.keys(this.neighbors));
		console.log("\n"+ this.description + " " + this.hint + "\n\n");
	}

	
module.exports = Room;