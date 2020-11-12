---
layout: post
title: "All current apps work with macOS Catalina"
date: 2019-10-06
tags: [macos, denied, petrify, relax, pipvid, timeless]
description: "macOS 10.15 Catalina just came out. I'm happy to report all apps support the new operating system."
---

Apple chose today to release macOS 10.15 Catalina. The latest major update to the Mac operating system. 🥳

I've been testing Denied, Carbonize, Relax, Pipvid and Timeless with every new beta since they came available and I'm happy to report they all work fine.

### Upgrading

You'll get a notification about the update at some point. If you want to upgrade early, open System Preferences and select System Update.

![A screenshot of the Catalina upgrade dialog](/assets/img/news/catalina-upgrade.png)

After a moment or two you'll get the option to Upgrade Now.

### Denied

iTunes has been replaced by separate apps for music, podcasts, TV and books. All very appropriately named after the media they expose. I've added support for Music.app in Denied v1.7.

Song skipping through all filters works perfectly. There's an unfixed bug in Music that prevents Denied from grabbing the track information when the app first launches and before Music was set to play, pause, skip to the next or previous track. This is mainly cosmetic. I'm confident Apple will address the issue in a future update to Catalina.

![A screenshot showing Denied and Music.app on Catalina](/assets/img/news/denied-catalina-music.jpg)

### Pipvid

QuickTime gained a built-in picture-in-picture mode in macOS 10.15. I've been on the fence about removing my custom solution, now there's a native implementation.

For the moment I've decided to stay with the custom feature I built specifically for Pipvid. The main reason being that my solution allows me to enable and disable picture-in-picture by simply resizing the player window. I love that feature myself.

The new pip-button in QuickTime is easily accessible to those who prefer the native variant.

I'm working on a hybrid solution that could make the best of both options. That's not quite ready yet.

### Others

Carbonize, Relax and Timeless work exactly like they did on macOS Mojave. I hope you'll enjoy them as much on Catalina as you did on Mojave. 😄

Have fun exploring the new features!
