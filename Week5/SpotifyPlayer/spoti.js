
$('form').on('submit', function(event){
	event.preventDefault()

	var request = $.get('https://api.spotify.com/v1/search?+&type=track&q='+$('input').val())
	
	request.done(function(result) {
		var song = result.tracks.items[0]
		$('.title').text(song.name)
		$('.author').text(song.artists[0].name)
		$('.author').attr('data-artist', song.artists[0].id)
		$('img').prop('src', song.album.images[0].url)
		$('audio').prop('src', song.preview_url)
	});
});

$('.btn-play').on('click', function(event){
	event.preventDefault()
	if ($('.btn-play').prop('class') === 'btn-play'){
		$('.btn-play').prop('class', 'btn-play playing')
		$('audio').trigger('play')
	}else{
		$('.btn-play').prop('class', 'btn-play')
		$('audio').trigger('pause')
	}
});

$('.js-player').on('timeupdate', function() {
	var current = $('.js-player').prop('currentTime');
	$('progress').prop('value', current)
})

$('.author').on('click', function (event){
	event.preventDefault()
	var request = $.get('https://api.spotify.com/v1/artists/'+event.currentTarget.dataset.artist)

	request.done(function(result) {
		$('.artist-name').text(result.name)
		$('.artist.pic').prop('src', result.images[1].url)
		$('.artist-followers').text('Followers: '+result.followers.total)
		$('.artist-popularity').text('Popularity: '+result.popularity)
		debugger
		$('.js-modal').modal()
		
	});

})







