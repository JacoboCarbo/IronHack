"use strict";
function countdown(seconds){
	setTimeout(function () {
		console.log(seconds);
		if(seconds>0){
			countdown(seconds - 1);
		}
	}, 1000);
}

countdown(1);
