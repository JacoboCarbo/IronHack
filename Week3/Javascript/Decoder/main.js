'use strict';
var decode = require("./decode.js");
var super_decoder = require("./super_decoder.js");

var words = [
    'January',
    'lacks',
    'caveats',
    'hazardous',
    'DOORS',
    'crying',
    'arrogantly',
    'climate',
    'proponent',
    'rebuttal'
];
var message = [
	"maaaa ",
	"aaaaaa",
	"aoaa)a",
	"aaaaaa",
	"aat:aa",
	"aaaaaa",
	"aa haa",
	"aaaaaa",
	"auaaea",
	"aaaaaa",
	"oaaaar",
	"aaaaaa",
	"faaaay",
	"aaaaua",
	"auaa a",
	"aaaaua",
	"aackaa",
	"aaaaua",
	"aackaa",
	"aaaaaa",
	"auaaea",
	"aaaaea",
	"faaaer",
];
console.log(decode(super_decoder(message,"odd", "")));
console.log(decode(super_decoder(words)));
