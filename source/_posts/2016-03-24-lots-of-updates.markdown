---
layout: post
title: "Lots of Updates"
date: 2016-03-24 10:00
comments: true
categories: [adventures, porthole, denied, airvlc]
---

[Porthole v1.7.8](/porthole), [AirVLC v1.1.2](/airvlc) and [Denied v1.3.0](https://www.getdenied.com) are out now. I released quite a few updates the past month and forgot to write about it. So, here's a quick overview of what I've been working on.

<!-- more -->

For all apps I've updated the update framework &mdash; if that makes sense. All updates are now deliverd securely over **https**, instead of just http and using the latest version of the [Sparkle](https://www.sparkle-project.org) update framework. Let's go into the specifics of what has changed under the hood of Porthole, AirVLC and Denied.

## Porthole

* Updated the update framework.
* Switched to using HTTPS all through the app.
* Updated the project in general.
**Note:** Porthole is now compatible with OS X 10.7 and up. Use one of the previous releases if you’re on OS X Snow Leopard.

## AirVLC

* Updated the update framework.
* Switched to using HTTPS all through the update.
* Updated the project in general.
**Note:** AirVLC is now compatible with OS X 10.7 and up. Use one of the previous releases if you’re on OS X Snow Leopard.

The updates for AirVLC and Porthole are pretty similar and mostly focus on bringing the apps into 2016. As a result both apps are now compatible with OS X 10.7, instead of OS X 10.6.8 If you require a legacy version, you can get it [here for Porthole](/porthole/legacy) and [here for AirVLC](/airvlc/legacy).

## Denied

* Denied displays Spotify album art again!
* Instead of just using the slider, you can now enter the amount of days Denied should remember Repeating Songs.
* Updated the update framework.
* Brought the rest of the project into 2016 ;).
* Bugs were fixed, performance was tweaked.

Denied's update introduces a more finegrained manner to specify the amount of time Denied should prevent repeat plays. Instead of just adjusting the slider you can actually enter the number of days.

![New repeating song judge in Denied v1.3.0](/images/adventures/denied/screenshots/v1.3.0-repeating-judge.jpg)

Apple resets reviews in the Mac App Store after an update comes out, so I was pretty stoked to see a few new ones appear almost straight away. The creative ways in which people describe how Denied helps them out is awesome, so I'd like to share a few here:

>&#11088;&#11088;&#11088;&#11088;&#11088; **A must-have for public Spotify playlists!**

>This app is so good it should be integrated into Spotify itself. If you listen to public playlists or some charts, and are tired of that one song that just keeps playing all the time — get Denied.

>by dubstrike from the US on Feb 24, 2016

---

>&#11088;&#11088;&#11088;&#11088;&#11088; **Essential.**

> I can’t imagine a Mac with this uninstalled. Especially with Apple Music and Stations, the risk of hearing an Adele song grew too great. Now rather than hearing her dreadful wailing, I get a notification reminding me that my ears have been saved from the misery once more. Works perfectly, every time.

>by David Harrison from the UK on Mar 22, 2016

They're all great, but especially the last one cracked me up.

## Hedge for Mac

I'm working on a startup with three other guys called Hedge for Mac. It's an app for OS X, aimed at video professionals, that helps you import data from your camera and make multiple copies &mdash; or backups &mdash;, securely and quickly.

![Hedge for Mac](/images/adventures/hedge/screenshots/almost-done.jpg)

We launched version 1.0 on March the 22nd. For more information [check out the website](https://www.hedgeformac.com) and download the trial version.

That's it for now. For more frequent updates about Danger Cove apps, consider following me on [Twitter](https://www.twitter.com/dangercove) or [Facebook](https://www.facebook.com/dangercove).
