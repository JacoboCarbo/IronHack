'use strict';

function average(numbers){

	var numbers_array = numbers.split(':');

	var number_of_alements = numbers_array.length;

	var numbers_integers = numbers_array.map(function(number){
		return parseInt(number);
	});

	var sum = 0;
	numbers_integers.forEach(function (number){
		sum+=number;
	});

	average = sum/number_of_alements;
	console.log(average);
}

var numbers = '80:90:100:70';

average(numbers);