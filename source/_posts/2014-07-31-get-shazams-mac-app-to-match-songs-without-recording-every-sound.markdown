---
layout: post
title: "Use Shazam's Mac App Through Porthole to Match Songs Without Recording Every Sound in the Room"
date: 2014-07-31 09:26
comments: true
categories: [porthole, privacy]
---

Shazam, the amazing music recognizing service, [released a Mac app today](http://www.shazam.com). It listens for audio around your Mac and tries to match it to music and tv series. Pretty awesome!

I don't particularly like the idea of having an app listening to every sound in my office/home though. So I did some testing and it seems it selects the default audio device for recording. Normally this is your microphone, which obviously picks up any sound in the room.

<div class="thumbnail">
{% img /images/content/porthole-shazam.jpg Shazam for Mac %}
</div>

If you're streaming to AirPlay speakers with [Porthole](http://www.getporthole.com) however, the default recording device is [Soundflower](http://cycling74.com/products/soundflower/). Soundflower only records all the audio that would normally come out of your Mac's speakers. This feels a lot more private and comfortable to me.

Here's how to set it up:

<!-- more -->

1. [Download Shazam](https://itunes.apple.com/us/app/shazam/id897118787);
1. Quit Shazam if it's already running (important, don't skip this!);
1. [Download Porthole](http://www.getporthole.com/download);
1. Start streaming with Porthole;
1. Launch Shazam.

If you stop streaming, Shazam will still be listening to Soundflower's output, which outputs nothing. As an added bonus, because the sound comes in crystal clear, Shazam might be able to match it a little faster ;).

Do note that Shazam might change this behavior in the future and force it to use the microphone, but for now this seems to be a more private way to use Shazam on your Mac. Also remember that if you restart Shazam (or run it at login) it will default to using the microphone.

<div class="text-center">
<a href="http://getporthole.com" class="btn btn-large btn-success">Get Porthole!</a>
</div>