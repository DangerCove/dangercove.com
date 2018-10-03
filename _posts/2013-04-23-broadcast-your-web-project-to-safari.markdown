---
layout: post
title: "Broadcast your web project to Safari"
date: 2013-04-23 15:26
comments: false
categories: [adventures, coucou]
---

If you work on web projects in a team, you're probably familiar with the situation where you want to quickly show your design or progress to a colleague, or test it on another computer. Usually this involves calling the person over or writing down/copying/emailing your IP address of the day.

Or you can use coucou + Safari and be done in a few seconds.

Safari has a special feature called "Bonjour bookmarks" that allows you to list all local web services your bookmarks bar, given that they are broadcasted using Bonjour. Coucou can help you with that last part. The broadcast menu in coucou lets you fire up custom services, like your Rails/MAMP/whatever project.

### Start your web project

![Start your web project](/assets/img/old/content/coucou-site-terminal.png)

*Start your web project*

<!-- more -->

Like I said above, this will work with any type of local web server. Replace Rails with MAMP, Django or whatever you like, just remember to alter the port accordingly in the following step.

### Broadcast your local web server

Launch [coucou](http://appstore.com/mac/coucou), enable the Broadcast option in the preferences and create a new service.

![Add a new service](/assets/img/old/adventures/coucou/screenshots/coucou-newservice.jpg)

*Choose the correct preset, or enter "_http._tcp." and the port manually*

### Enable Bonjour bookmarks

Launch Safari and enable Bonjour bookmarks; they're disabled per default.

![Enable Bonjour bookmarks](/assets/img/old/content/coucou-safari-preferences.png)

*You can enable Bonjour bookmarks on the Bookmarks tab*

![Show bookmarks bar](/assets/img/old/content/coucou-safari-showbookmarks.jpg)

*Don't forget to display the bookmarks bar*

### Select your service from the menu

And that's it. Click the menu item and it'll load your website without copy-pasting, emailing or writing down your IP address!

![Select your service](/assets/img/old/content/coucou-safari-bonjourbookmark.jpg)

*Your web service should show up in the list*

### Video

<iframe width="620" height="349" src="https://www.youtube.com/embed/7M9xcwbICPs" allowfullscreen></iframe>

Curious about what else coucou can do? Check out [this post](/blog/2013/03/29/coucou-for-easy-network-access) about using coucou to discover network services.

[![Available on the Mac App Store](/assets/img/old/MacAppStore_download.png)](https://itunes.apple.com/app/coucou/id620436774)
