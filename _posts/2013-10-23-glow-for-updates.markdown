---
layout: post
title: "Glow for updates"
date: 2013-10-23 17:17
comments: false
categories: [glow, updates, open source]
---

Everybody knows software updates. A window pops up to notify you an update is available, 
you accept and a few seconds later you have new features (and less bugs, hopefully).

Automatic software updates are great and generally make everybody's lives
better. As a developer I can be sure most of my customers are using the latest
version. As a user you press a single button to update, instead of going to
the website, downloading a new package and overwriting the previous version.

All Danger Cove apps (except the ones on the App Store) use [Sparkle](http://sparkle.andymatuschak.org/)
for automatic updates. Sparkle checks a feed every day and lets you know when a
new version is available. Getting that feed online is what I want to talk about
today.

<!-- more -->

Previously I manually edited these feeds and manually wrote the [release
notes](http://update.getporthole.com/release_notes/?source=article) in a text
editor. Knowing that I have to look up version numbers, file sizes and sign the
update (for security, nobody should be able to release an update in my name).
This can take some time.

That's why I've made [Glow](https://github.com/DangerCove/Glow) and if you're a
software developer, it might come in handy for you as well. That's why I've
released it on GitHub. Here's my description of it.

> Glow is a tool that generates Sparkle-compatible Appcast update feeds and html release notes for your Mac projects. It's not a full blown, database driven, multiple project supporting, update releasing laser canon. Rather it's a clean, easy to use script that will automate 90% of releasing updates to your users.

The [GitHub page](https://github.com/DangerCove/Glow) contains a very detailed 
walkthrough on how to get started.

Automating the process of creating these updates leaves more time to work on
fixing bugs and adding cool new features. Also, I might have some more time to
style those release notes :).
