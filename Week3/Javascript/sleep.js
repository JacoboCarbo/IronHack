"use strict";
function countdown(seconds){
	setTimeout(function () {
		console.log(seconds);
		if(seconds>0){
			countdown(seconds - 1);
		}else{
			console.log("Blast Off!");
		}
	}, 1000);
}

countdown(3);
