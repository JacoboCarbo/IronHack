
function listArtists(artists){
	var artistList = artists.artists.items.map(function(artist){
		var format = "<div class='media'>" 
		if (artist.images.length !== 0){
			format += "<div class='media-left media-middle'>" +
				      	"<img class='media-object my-thumbnail' src='"+ artist.images[0].url +"' alt="+ artist.name+ ">" +
					  "</div>"
		}
		format +="<div class='media-body media-middle'>" +
					    "<a href='#' data-artist-id='"+artist.id+"'class='artist-link'>"+ artist.name +"</a>" +
					  "</div>" +
					"</div>"	  
		return format
	}).join('\n');
	return artistList;
};

function displayArtist(artist){
	var format = "<div class='jumbotron'>"+
					"<div class='container'>"
	if (artist.images.length !== 0){
		format += "<div>" +
			      	"<img class='artist-front-image' src='"+ artist.images[0].url +"' alt="+ artist.name+ ">" +
				  "</div>"
	}
	format +="<div>" +
				"<h3><strong><em>"+ artist.name +"</em></strong><h3>" +
				"<h5> Followers: "+ artist.followers.total +"<h5>" +
				"<h5> Popularity: "+ artist.popularity +"%<h5>" +
			 "</div>" +
			"</div>"+
		"</div>"	  
	return format
}


$('form').on('submit', function(event){
	event.preventDefault();

	function handleArtists (artists){
		$('.artist-list').html(listArtists(artists));
	}

	$.ajax({
		type:'GET',
		url: 'https://api.spotify.com/v1/search?type=artist&query='+$('input').val(),
		data: '',
		success: handleArtists,
		error: function(param){
			console.log(param);
			console.log('ERROR');
			},
		dataType: "json"
	});
})

$('.container').on('click','.artist-link', function(event){
	event.preventDefault();

	function listArtist(artist){
		$('.artist-list').html(displayArtist(artist));
	}

	$.ajax({
		type:'GET',
		url: 'https://api.spotify.com/v1/artists/'+ event.currentTarget.dataset.artistId,
		data: '',
		success: listArtist,
		error: function(param){
			console.log(param);
			console.log('ERROR');
			},
		dataType: "json"
	});
});
