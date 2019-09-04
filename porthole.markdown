---
layout: app/discontinued
site_title: Porthole has been discontinued
title: Porthole
subtitle: AirPlay all audio to multiple speakers
description: >-
  Play all audio from your Mac through multiple AirPlay speakers at the same time.
date: 2017-01-10
icon: porthole-icon.png
hero: 
  icon: porthole-icon.png
  dominant_color: 
    r: 181 
    g: 205 
    b: 219
screenshots:
  - src: porthole-setup.jpg
    alt: Screenshot of Porthole's setup wizard
    caption: Screenshot of Porthole's setup wizard
  - src: porthole-volume.jpg
    alt: Screenshot of Porthole's per speaker volume control
    caption: Per speaker volume controls
  - src: porthole-scripting.jpg
    alt: Screenshot of Porthole's scripting features
    caption: Automate Porthole using AppleScript
  - src: porthole-hotkeypanel.jpg
    alt: Screenshot of Porthole's hotkey panel
    caption: Hotkey panel
tags:
  - Discontinued
topic: porthole
permalink: /porthole/
---

Porthole was the first app ever released by Danger Cove. I started on it in December 2011 and released the first version in Januari of 2012. It allowed you to stream all the audio from your Mac to any AirPlay output on the network, even at the same time. The music would come out of the speakers synchronized, allowing you to walk around the office, or your house and enjoy music everywhere.

![A screenshot of Porthole playing to multiple AirPlay speakers](/assets/img/app/porthole-menu.jpg)

## Why it's been discontinued

None of the AirPlay protocol is officially documented. Connecting and streaming to an AirPlay device requires inspecting network packages, cracking encryption and painstakinly piecing together all the steps that are needed by the speaker to cooperate.

With every new firmware release for the AirPort Express or Apple TV, Apple could break Porthole's functionality. This happened a few times and caused Porthole to stop working until I mended what was broken. Not an ideal experience for users of Porthole, or myself for that matter.

Luckily Apple wasn't sitting still. In 2017 they announced AirPlay 2, an updated version of the protocol that would allow streaming to multiple AirPlay devices from your Mac and any mobile device (a much requested feature for Porthole). It took a year for ultimately land, but with macOS Mojave and iOS 12 Porthole has been made fully obsolete by the built-in features of Apple's desktop _and_ mobile operating system.

## Related news

{% include related/news.html posts=site.tags.porthole %}

## What others said

### On Twitter

<blockquote class="twitter-tweet" lang="en"><p>New years eve was a great success. Fuelled by <a href="https://twitter.com/getporthole">@getporthole</a> multi room <a href="https://twitter.com/Spotify">@Spotify</a>, great app for syncronising AirPlay.</p>— Will Beardmore (@willbeardmore) <a href="https://twitter.com/willbeardmore/status/550675190129373184">January 1, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p>My <a href="https://twitter.com/Spotify">@Spotify</a> and <a href="https://twitter.com/getporthole">@getporthole</a> setup is super awesome. Streaming songs straight off the internetz into any room in my house. Indie everywhere!</p>— Rob Whittaker (@purinkle) <a href="https://twitter.com/purinkle/statuses/480438015060635648">June 21, 2014</a></blockquote>

### In the media

> While you can stream your iTunes audio over AirPlay – that’s it. Pandora, Rdio, Spotify, or users of any other audio app are out of luck. That’s where Porthole comes in, it’s a nifty little utility that lets you stream all of your Mac’s audio over AirPlay.
>
> — Alex Arena ([appstorm.net](http://mac.appstorm.net/roundups/utilities-roundups/five-cool-uses-for-airplay))

> Porthole adds an item to your menu bar that transfers your system audio to an AirPort Express with one click. It's a piece of cake.
>
> — Adam Pash ([lifehacker.com](https://lifehacker.com/5895637/porthole-streams-your-macs-audio-to-your-airplay-devices))
