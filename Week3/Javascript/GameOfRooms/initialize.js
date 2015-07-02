'use strict';

var Room = require('./room.js');
var Player = require('./player.js');
var Game = require('./game.js');

// Initialize game.
var player = new Player();
var room1 = new Room("You are in the patio. ", " There are 4 exits, explore them all!");
var room2 = new Room("You are in the garden. ", "There is a shovel in that corner.");
var room3 = new Room("You are in the living room. Whoever lives here is going to get pissed when he comes back... ", " Maybe I should get out of here");
var room4 = new Room("You are at the lake.  ", "The soil looks loose under that tree.", "DIG");
var room5 = new Room("You are in the garage. ", "There's a classic 1975 Harley Davidson, I wish I owned it... ", "START");

room1.mapNeighbors({"N": room2, "E": room3, "S": room4, "W": room5});
room2.mapNeighbors({"S": room1});
room3.mapNeighbors({"W": room1});
room4.mapNeighbors({"N": room1});
room5.mapNeighbors({"E": room1});

room2.inventory.addItem("SHOVEL");

var rooms = [room1, room2, room3, room4, room5];
var game = new Game(player, rooms);

game.run();




