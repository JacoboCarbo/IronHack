'use strict';
module.exports = decode;

function decode(message){
	var decoded = "";

	for(var i=0, j=0; i<message.length;i++, j++){
		j = j % 5;
		decoded+=message[i][j];
	};
	return decoded;
};





