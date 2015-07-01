'use strict';
module.exports = super_decode;
var decode = require("./decode.js");

function super_decode(message, even_odd, direction){
	var special_message;
	// Filter even or odd words out of the original message.
	if(even_odd === "odd"){
		special_message = message.filter(function(word, index){
			if (index % 2 === 0){
				return true;
			}
		});
	}else if(even_odd === "even"){
		special_message = message.filter(function(word, index){
			if (index % 2 != 0){
				return true;
			}
		});
	}else {
		special_message = message;
	}

	// Reverse message if required
	if(direction==="r"){
		special_message = special_message.reverse();
	}

	return special_message;
}
