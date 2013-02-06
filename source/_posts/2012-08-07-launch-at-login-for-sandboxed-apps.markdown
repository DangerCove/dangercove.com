---
layout: post
title: "Launch at Login for sandboxed apps"
date: 2012-08-07 18:22
comments: true
categories: [code]
---

"Launch at Login" was quite simple to implement. It even fits in a single gist: [gist.github.com/1409312](https://gist.github.com/1409312). Sandboxing changed this and made it "little" more troublesome.

Tim Schröder wrote [a great article about this](http://blog.timschroeder.net/2012/07/03/the-launch-at-login-sandbox-project/), that combines very well with Alex Zielenski’s [StartAtLoginController GitHub project](https://github.com/alexzielenski/StartAtLoginController) into a Helper Project that’ll allow you to easily add “Launch at login” to multiple Apps.

Tim’s example uses hardcoded information to launch the main App from the Helper App and toggle Launch at Login. Which makes it super easy to understand, but less flexible to use in multiple projects. That’s where Alex’ Controller comes in. It’ll allow you to add the Helper Project to your main Project, add a new target, drag it your main app’s “Copy Files” build phase and be done with it.

[This stackoverflow post](http://stackoverflow.com/questions/11292058/how-to-add-a-sandboxed-app-to-the-login-items) links to [a demo project](http://ge.tt/6DntY4K/v/0?c) that has most of the code in place, but doesn’t use Tim’s pretty Workspace method of setting things up. I mixed them together and made a new GitHub project that should help you setup your project pretty quickly.

Check out the source: [https://github.com/DangerCove/LaunchAtLogin](https://github.com/DangerCove/LaunchAtLogin)

Oddities and things you should know:

{% blockquote %}
This will only work if your .app is in /Applications or ~/Applications, making it harder to debug.

Manually running the Helper App from the main App’s Contents folder will sometimes not launch the main app if ‘Launch at Startup’ hasn’t been activated for your app. So first run the app, check the checkbox and try again.
{% endblockquote %}
