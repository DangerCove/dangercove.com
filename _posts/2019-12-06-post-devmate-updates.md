---
layout: post
title: Post-DevMate updates
date: 2019-12-06 20:00:00 +0000
tags:
- pipvid
- relax
- carbonize
- timeless
- updates
description: With DevMate's end-of-life date approaching I've updated every app to
  remove its SDK.

---
With [DevMate sunsetting](https://announcement.devmate.com) in little over a week I've issued an update for every app that included the DevMate SDK.

### 🎧 [Relax 1.2](/relax)

Besides removing the DevMate SDK I've also included support for pausing Music.app in macOS Catalina. 👌

You'll notice that I've updated the [App Store](/relax/appstore) screenshots as well. I liked the eye piercing background color of the original images, but I think this is a little more appealing. 😅

![New Relax App Store screenshot](/assets/img/news/relax-Headphones-Fullscreen.jpg)
*After*

![New Relax App Store screenshot](/assets/img/news/relax-Settings-Fullscreen-purple.jpg)
*Before*

### 📹 [Pipvid 2.0.1](/pipvid)

Like Timeless this updates switches the update mechanism from the DevMate SDK to just [Sparkle](https://sparkle-project.org)'s update mechanism. Updates are hosted at Microsoft's [AppCenter](https://appcenter.ms), for now.

### 🕔 [Timeless 0.9.8](/timeless)

This is getting very close to its initial 1.0 release!

### 🎨 [Carbonize 1.2.9](/carbonize)

I've included an [Internet Access Policy](https://obdev.at/iap/index.html) to every app that accesses remote resources. With an IAP apps like [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) can display a meaningful message when asking you to allow or block an app's request to fetch an online resource.

Carbonize benefits from this because it _requires_ access to [carbon.now.sh](https://carbon.now.sh). The message that a firewall like Little Snitch displays reflects that now.