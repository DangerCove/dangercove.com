---
layout: post
title: "Denied v1.7 adds support for Catalina's Music.app"
date: 2019-09-30
tags: [denied, updates]
description: "The latest update to Denied adds preliminary support for Apple's iTunes replacement called Music."
---

Since the first Beta of macOS 10.15 Catalina became available on June 6th, I've been working on adding support for the new Music app that will replace iTunes to Denied.

A [bug](https://twitter.com/boyvanamstel/status/1177589988902486017) in the new operating system made this less than trivial unfortunately. Every time Denied tries to retrieve the title of the current track, it gets an error. After waiting nine beta releases for Apple to address the issue, I decided to ship an update that works around the issue.

This means that [Denied](/denied) version 1.7 with preliminary support for Catalina's Music app is now [available for download](/denied/appstore). 🚀

I say _preliminary_ because it focusses on skipping tracks through one of the familiar filters. There is a known issue that prevents Denied from grabbing the track information when the app first launches and before Music.app was set to play, pause, skip to the next or previous track. As soon as Apple resolves the issue it should work exactly like it did on previous versions of macOS.

![Denied's App Store artwork showing off its explicit content filter](/assets/img/news/denied-macbook-skip-explicit-with-caption.jpg)

Here's a complete list of changes I made. It's a pretty huge update!

### Added

* This update adds preliminary support for future versions of macOS and their music app.

👆 _Apple rejects apps that mention the name of apps and macOS versions that haven't been released yet, hence the vague mention of what this update actually introduces._

### Changed

* I've updated the project and its dependencies.
* The animations have been redone.
* The minimum supported version of macOS is now 10.14 Mojave.
* Lots of under the hood improvements have been made.

### Removed

* The crash reporter has been removed, as the service I was using is being retired. I'm keeping an eye out for an alternative. You can always get help through [support.dangercove.com](https://support.dangercove.com)
