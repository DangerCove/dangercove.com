// Setup Youtube controls
var ytPlayer,
    ytTag = document.createElement('script'),
    ytFirstScriptTag;

    ytTag.src = "https://www.youtube.com/iframe_api";
    ytFirstScriptTag = document.getElementsByTagName('script')[0];
    ytFirstScriptTag.parentNode.insertBefore(ytTag, ytFirstScriptTag);

$(document).ready(function(){
  
  $('.screenshots .selectable').on('click', function(e) {
    var src = $('img', this).attr('src'),
        caption = $('p', this).text();

    $('.screenshot img').attr('src', src);
    $('.screenshot p').text(caption);

    $('.screenshots .selectable').removeClass('active');
    $(this).addClass('active');
  });

  $('.video-preview').on('click', function(e) {
    e.preventDefault();

    var href = $(this).attr('href');
    $(href).fadeIn();

    if(ytPlayer) {
      ytPlayer.playVideo();
    }
  });
  $('.video-lightbox').on('click', function(e) {
    e.preventDefault();
    
    $(this).fadeOut();
    if(ytPlayer) {
      ytPlayer.pauseVideo();
    }
  });

});

// Youtube controls
function onYouTubeIframeAPIReady() {
  ytPlayer = new YT.Player('video-gettingstarted-placeholder', {
    width: '',
    height: '',
    videoId: 'zzoGEhWTXRw', // Getting started
    playerVars: {rel: 0},
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

function onPlayerReady(event) {
    event.target.setPlaybackQuality('hd720');
}
function onPlayerStateChange() {
}