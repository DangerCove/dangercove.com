---
layout: post
title: Improved disliked song skipping for Denied
date: 2018-11-07 08:00:00
tags: [updates, denied]
description: Denied 1.5.2 fixes a bug that prevented some disliked songs from being skipped.
---

Apple's just approved the latest update for Denied. Version 1.5.2 fixes a bug that prevented Denied from retrieving the 'disliked' state of a track when it did not have artwork.

You can get the update on the [Mac App Store](https://www.denied.app/appstore). 🚀


Instead of just pushing the update and forgetting the bug ever existed, I thought it would be interesting to tell you what exactly went wrong and how I resolved the issue.

<!-- more -->

## Introduction

Denied follows a set pattern to shape your listening experience.

1. Get notified of a song change.
1. Retrieve the song's properties.
1. Check if these attributes match any rules.
1. Skip the track if a match was found.

To fetch a song's title, artist etc. from iTunes or Spotify, Denied relies on [AppleScript](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html). This scripting language allows anyone to hook into an application (if it supports it) and retrieve information from it. Try this quick example.

1. Launch Script Editor (/Applications/Utilities/Script Editor.app).
2. Create a new document.
3. Copy-paste the lines below. (Make sure you copy the lines for the right player.)

        #Spotify
        tell application "Spotify"
        	name of current track
        end tell
        
        #iTunes
        tell application "iTunes"
        	name of current track
        end tell

1. Play a song.
1. Run the script.

You should see the name of the current track in the Description field of the Script Editor.

## The bug 

Besides the track title, Denied also fetches the artist, the album, the artwork and (for iTunes) whether a track is disliked. Here's what that script looks like.

```
property trackName : ""
property trackArtist : ""
property trackAlbum : ""
property trackArtwork : ""
property isDisliked : false
if application "iTunes" is running then
	tell application "iTunes"
		try
			set trackName to name of current track
			set trackArtist to artist of current track
			set trackAlbum to album of current track
			set trackArtwork to data of artwork 1 of current track
			set isDisliked to disliked of current track
		end try
	end tell
end if
return {trackName, trackArtist, trackAlbum, trackArtwork, isDisliked}
```

This all works perfectly fine when scanning a track that has every property setup properly. The track's artwork isn't that reliable, unfortunately. Sometimes tracks don't have artwork at all, sometimes it takes a few moments before it's retrieved from the internet. I assumed the field would just remain empty then. That's not what happens, though.

If the song's artwork does not contain an image, the script returns the default value for all the parameters after it (`property isDisliked : false`). You can see why this would prevent Denied from ever knowing if a song without artwork was actually disliked.

## The fix

Instead of fetching the artwork in the same script as the other properties, I made a seperate method that handles everything artwork related. This is similar to how I implemented fetching artwork for Spotify.

## Conclusion

This was a pretty easy fix and I'm happy Apple approved the update withing a few hours. I've added some songs without any artwork to my test suite, so this shouldn't happen again. I hope you found this interesting. 🙂

_This post originally appeared on [denied.app](https://www.denied.app/news/improved-disliked-song-skipping/)._
