'use strict';

function averageFor (number) {
	var results = 0;

	for (var i = 0; i < number.length; i++) {
		results = results + parseInt(number[i]);
	};

	results = results / number.length;

	return results;
}

var numbers = '80:90:100:70';
var numbers_array = numbers.split(':');

console.log(averageFor(numbers_array));