var $ = require('jquery')


var makeRequest(id) = {
	makeRequest; function(id){
		var xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function(){
			if (xhr.readyState ===4){
				$('body').append(xhr.responseText)
			}
		}
		xhr.open('GET', 'http://ironhack-characters.herokuapp.com/characters'+id)
		xhr.send()
	}
}

var character = {
	makeRequest: makeRequest,
}

module.exports = character