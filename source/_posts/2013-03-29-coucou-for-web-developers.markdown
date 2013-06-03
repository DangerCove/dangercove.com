---
layout: post
title: "Coucou for Web Developers"
date: 2013-03-29 13:08
comments: true
categories: [adventures, coucou, tutorial]
---

If you're a web developer you probably recognize that moment where you're running a local development evironment with MAMP/XAMPP, Rails or Node.js and need to see your site on another computer, or show someone else what you're working on. Maybe to do a cross-browser check, maybe just to show how awesome this latest design looks.

This usually involves copy-pasting of ip addresses, emailing and other such nonsense. With coucou this can be done in just a few simple clicks. Let me walk you through it.

First we need to enable broadcasting in the preferences pane.

<div class="thumbnail">
{% img /images/adventures/coucou/screenshots/coucou-preferences2.jpg "Enable broadcasting" %}
<div class="caption">
Enable broadcasting
</div>
</div>

Now follow these steps:

<!-- more -->

* click the menu bar icon;
* select Broadcast and click New Service...;
* select one of the presets in the window that pops-up or create a service manually;
* click publish and you're set!

<div class="thumbnail">
{% img /images/adventures/coucou/screenshots/coucou-newservice.jpg "Add a new service" %}
<div class="caption">
Add a new service
</div>
</div>

<div class="thumbnail">
{% img /images/adventures/coucou/screenshots/coucou-rails.jpg "Find a custom service" %}
<div class="caption">
Your service is now visible for anyone using coucou, or any other Bonjour compatible app
</div>
</div>

You can unpublish the service by clicking the corresponding entry in the Broadcast menu.

<a href="https://itunes.apple.com/app/coucou/id620436774">{% img /images/MacAppStore_download.png "Available on the Mac App Store" %}</a>
