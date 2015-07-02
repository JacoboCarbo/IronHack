'use strict';
var read = require('read');


//Game
var Game = function (player, rooms) {
	this.status = true;
	this.player = player;
	this.rooms = rooms;
	this.currentLocation = rooms[0];
}

	// Read from keyboard
	var options = {
			prompt: "> "
	};

	Game.prototype.run = function () {
		this.printIntro();

		this.promptCommand();
	}

	Game.prototype.printIntro = function () {
		console.log("\n-----------------------------\n");
		console.log("Welcome to the Game of Rooms.");
		console.log("\n-----------------------------\n");
	}

	Game.prototype.move = function (direction){
		if (Object.keys(this.currentLocation.neighbors).indexOf(direction)!= -1){
			this.currentLocation = this.currentLocation.neighbors[direction];
			console.log("\nYou moved "+direction);
			this.currentLocation.printRoomInfo;
		}
		else {
			console.log("Invalid direction. Try again.")
		}
	}

	Game.prototype.pickUp = function (command) {
		var itemToPick = command.substr("pick up".length+1);
		if (this.currentLocation.inventory.items.indexOf(itemToPick)!= -1){
			this.currentLocation.inventory.removeItem(itemToPick);
			this.player.inventory.addItem(itemToPick);
			console.log("You picked up: " + itemToPick);
		}else {
			console.log("\nNo such item in this room...\n");
		}
	}

	Game.prototype.drop = function (command) {
		var itemToDrop = command.substr("drop".length+1);
		if (this.player.inventory.items.indexOf(itemToDrop)!= -1){
			this.player.inventory.removeItem(itemToDrop);
			this.currentLocation.inventory.addItem(itemToDrop);
			console.log("You dropped: "+itemToDrop);
		}else {
			console.log("\nNo such item in your inventory...\n");
		}
	}

	Game.prototype.promptCommand = function () {
		if(this.status === true) {
			this.currentLocation.printRoomInfo();
			read(options, this.interpretPrompt.bind(this));
		}
	}

	Game.prototype.interpretPrompt = function (err, command) {
		command = command.toUpperCase();

		var validMove = ["N", "S", "W", "E"];

		if (err) {
			throw err;
		}
		if (command === "EXIT"){

		} 
		else if (validMove.indexOf(command)!= -1) {
		   	this.move(command);
		   	this.promptCommand();
		} 
		else if (command === "INVENTORY"){
			this.player.printInventory();
			this.promptCommand();
		}
		else if (command.substr(0,7)==="PICK UP") {
			this.pickUp(command);
			this.promptCommand();
		} 
		else if (command.substr(0,4)==="DROP") {
			this.drop (command);
			this.promptCommand();
		}
		else if (this.player.inventory.items.indexOf("SHOVEL")!= -1 && this.currentLocation.actions.indexOf("DIG")!= -1 && command === "DIG"){
			console.log("You dug a hole and found a KEY!");
			this.player.inventory.addItem("KEY");
			this.promptCommand();
		}
		else if (this.player.inventory.items.indexOf("KEY")!= -1 && this.currentLocation.actions.indexOf("START")!= -1 && command === "START"){
			console.log("You started the engine of the motorbike and escaped!");
			console.log("Congratulations, you are the boss!");
			console.log("---------------THE END---------------");
			this.status = false;
		}
		else {
		   	console.log("Invalid command!");	
		   	this.promptCommand();		
		}
	}


module.exports = Game;

