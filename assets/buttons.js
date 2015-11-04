var failed = false;

function fixwidth(el) {
	if (!failed) {
		try {
			el.width = el.contentDocument.rootElement.width.baseVal.value;
			console.log('foo');
		}
		catch (e) {
			console.log(e);
			failed = true;
		}
	}
}

function stuff() {
	var plays = document.getElementsByClassName('fa-play');
	for (var i = 0; i < plays.length; i ++) {
		var play = plays[i];
		console.log(play);
		var id = document.getElementById(play.dataset.for) + '-yt';
		var player = new YT.Player(id, {
			events: {
				onReady: function() {
					console.log('foo');
				}
			}
		});
		play.onclick = function() {
			console.log(player);
			player.playVideo();
		}

	}
}
