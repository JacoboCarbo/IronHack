'use strict';
var Item = require("./item.js");
var ShoppingCart = require("./shoppingCart.js");

// Initialize Cart and items

var myCart = new ShoppingCart();
var apple = new Item("apple", 10);
var orange = new Item("orange", 5);
var grapes = new Item("grapes", 15);
var banana = new Item("banana", 20);
var watermelon = new Item("watermelon", 50);

myCart.addItem(new Item("apple", 10));
myCart.addItem(new Item("orange", 5));
myCart.addItem(new Item("orange", 5));
myCart.addItem(new Item("orange", 5));
myCart.addItem(new Item("orange", 5));
myCart.addItem(new Item("orange", 5));
myCart.addItem(new Item("orange", 5));
myCart.addItem(new Item("watermelon", 50));
myCart.removeItem("watermelon", 1);
myCart.total();
