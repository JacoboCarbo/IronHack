'use strict';

var ShoppingCart = function (){
	this.cart = new Array();
};

ShoppingCart.prototype.addToCart = function (item) {
	this.cart.push(item)
	console.log("Adding "+item.name+ " to the cart at a price of " + item.price);
}

var Item = function (name, price){
	this.name = name;
	this.price = price;
}
Item.prototype.setName = function (newName) {
	this.name = newName;
}

var myCart = new ShoppingCart();

var apple = new Item("apple", 10);
var orange = new Item("orange", 5);
var grapes = new Item("grapes", 15);
var banana = new Item("banana", 20);
var watermelon = new Item("watermelon", 50);

myCart.addToCart(apple);
myCart.addToCart(apple);
apple.setName("APPLE");
console.log(myCart.cart);