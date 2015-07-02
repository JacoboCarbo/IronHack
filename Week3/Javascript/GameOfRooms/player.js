'use strict';
var Inventory = require('./inventory.js');

//Player:

var Player = function () {
	this.inventory = new Inventory();
}

	Player.prototype.printInventory = function () {
		console.log(this.inventory.printItems());
	}

module.exports = Player;