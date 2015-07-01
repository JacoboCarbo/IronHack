"use strict";

function fileactions(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    episodes = episodes.filter(function(episode){
    	return episode.rating>=8.5;
    });
    episodes = episodes.sort(function(episode1, episode2){
  		return episode1.episode_number - episode2.episode_number;
	});

    episodes.forEach(function(episode){
    	var stars = Array(Math.round(episode.rating)+1).join("*")
    	Array(10).join("*")
    	
    	console.log("Title: " + episode.title + " #:" + episode.episode_number);
    	console.log(episode.description);
    	console.log("Rating: " + episode.rating + stars);
    	console.log("\n\n\n");
    });
}

module.exports = fileactions;