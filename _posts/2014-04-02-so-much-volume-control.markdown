---
layout: post
title: So much (volume) control
date: 2014-04-02 10:17
comments: true
tags: [apps, porthole, updates]
---

![Porthole volume control](/assets/img/old/content/porthole-volumecontrol.jpg)

Porthole's main volume control has always been the buttons on the keyboard. Pressing F10 will mute everything, F11 lowers it and F12 turns it up. Just as you'd expect when looking at the little icons on the keys, really.

<!-- more -->

Sometimes this isn't enough. Looking at the amount of votes this got on the [suggestion page](http://porthole.uservoice.com/forums/151703-general/suggestions/3661146-adjust-airplay-devices-audio-levels-individually), for quite a few people this wasn't enough. If you have a great deal of speakers around your home (or one that's particularly obnoxious, volume wise) being able to set a specific volume becomes important.

This posed a design challenge, more than a technical one. I frankly didn't feel comfortable adding an undetermined number of sliders to the interface. Porthole's main focus has always been elegance and ease of use. That doesn't mix well with a row of sliders, trust me. Also, I didn't want to give up the use of the volume keys.

After some consideration and tests, I came up with something that works. There are sliders, but they aren't in the main interface and they control the volume, but not in a way that conflicts with the volume keys. Instead of setting the volume absolutely, the sliders determine an offset, that's why you can set a negative number.

In practice, this works as follows: Say the main volume is at 5, one speaker has a -2 offset, the other +4. This means the absolute volume for speaker one is 3 and for the other 9. Pressing the volume keys to turn up the volume by 1, sets the speakers to 4 and 10 respectively.

This might take a bit to get used to, but I've found it works very very well. Especially because all volume preferences are saved per speaker.

Want to take this for a spin? Just [download version 1.6.0 or higher](http://www.getporthole.com/download)!
