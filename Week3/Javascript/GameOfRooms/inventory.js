'use strict';
//Inventory:

var Inventory = function () {
	this.items = new Array();
}
	
	Inventory.prototype.printItems = function (){
		console.log(this.items);
	}

	Inventory.prototype.addItem = function (item){
		this.items.push(item);
	}

	Inventory.prototype.removeItem = function (item){
		var index = this.items.indexOf(item);
		delete this.items[index];
	}

module.exports = Inventory;