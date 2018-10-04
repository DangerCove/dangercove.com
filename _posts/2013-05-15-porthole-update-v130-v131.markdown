---
layout: post
title: "Porthole Update v1.3.2"
date: 2013-05-15 09:32
comments: false
categories: [apps, porthole, updates]
---

I'm happy to have released two updates for Porthole this month, **version 1.3.0 and 1.3.1**. Why don't I walk you through some of the things that were updated and improved.

<!-- more -->

### Retina Graphics

For version 1.3.0 I focussed on cleaning up a lot of the interface. I never got around to adding **Retina-compatible graphics** to Porthole and this update takes care of about 90% of that. New in-app icons, setup wizard imagery etc. The AirPlay speaker icons were actually updated again in version 1.3.1 after I was told that graying out the music note when the speaker isn't connected seemed to suggest the option was unavailable, instead of just inactive.

![Porthole v1.2.2](/assets/img/old/content/porthole-old.jpg)

*Porthole v1.2.2*

![Porthole v1.3.0](/assets/img/old/content/porthole-v130.jpg)

*Porthole v1.3.0, notice the much sharper menu bar icon*

![Porthole v1.3.1](/assets/img/old/content/porthole-v131.jpg)

*Porthole v1.3.1, the speaker icon changes when it's connected*

### Setup Wizard

The setup wizard was next to receive a little overhaul. Instead of going with the named progress indicator along the top of the wizard I wanted to do something that is a little easier to maintain and localize. I ended up using [BFPageControl](https://github.com/bfolder/BFPageControl), which is actually a page control, but doubles easily as a low key progress indicator.

It's also a little shorter and the image on the first step has a more obvious indicator of what Porthole looks like, in the menu bar.

![Porthole v1.2.2](/assets/img/old/content/porthole-setup-old.jpg)

*Porthole v1.2.2*

![Porthole v1.3.1](/assets/img/old/content/porthole-setup-v131.jpg)

*Porthole v1.3.1*

### Embedded Store

Next thing on the list is the option to purchase a license for Porthole from within the app. It's entirely optional, but **it provides a nice flow that takes out the license-key-copy-pasting that's normally involved**. The store window opens a secure WebView connection to [FastSpring](https://sites.fastspring.com/dangercove/instant/porthole), with a theme that works well within an app.

It's actually a component that's provided and maintained by FastSpring themselves. You can get it [here, on GitHub](https://github.com/FastSpring/FsprgEmbeddedStoreMac).

![Porthole Purchase Window](/assets/img/old/content/porthole-buy-1.png)
![Porthole Purchase Window](/assets/img/old/content/porthole-buy-2.png)

### Soundflower's Volume

Porthole uses Soundflower to capture all the System Audio and transfer it to AirPlay speakers. I noticed that quite a few people encountered a bug where the output volume would be so low, the sound was practically inaudible. Upon further inspection I noticed that while Soundflower's master volume was working fine, the left and right channel volume would be turned all the way down. Porthole only manipulates the mast volume and thus would not be able to fix it on its own.

My previous way of handling this issue was to instruct people to manually turn up the volume using Audio MIDI Setup.app. Which works, but is cumbersome and only works for people who look up the solution in the FAQ or email me for help. I finally decided to add an automatic fix in version 1.3.0, but not without the option to turn it off for people who require the left and right volume to be set to separate values.

![Soundflower Volume Muted](/assets/img/old/content/porthole-midi.png)
![Soundflower Volume Fix](/assets/img/old/content/porthole-soundflowerfix.png)

### Password Protected AirPlay Speakers

This has been on my list for quite a while. It wasn't a feature that was often requested, but **it would enable everyone in more public spaces to password protect their speakers and still enjoy Porthole**. Using passwords in OS X is tightly connected to Keychain, which stores passwords for all apps and even allows you to share passwords between them. I want Porthole to be able to use AirPlay passwords stored by iTunes, for example. The API for implementing this changed quite a bit between OS X 10.6 and 10.7+, but by wrapping [MCSMKeychainItem](https://github.com/ObjColumnist/MCSMKeychainItem) and [sskeychain](https://github.com/soffes/sskeychain) this wasn't too much of a problem.

You can now easily connect to all password protected speakers, use passwords stored in Keychain, or add new passwords straight from Porthole. Awesome!

![Password Protected AirPlay Speakers](/assets/img/old/content/porthole-password.png)

### Other Minor Fixes

That's about it for the manjor changes, fixes and updates. Apart from those I also made sure windows that are open (Preferences, License Window, Embedded Store) are pulled to the front when the menu bar icon is clicked, making it easier to see where they are.

The text on the buttons and menu items is more consistent, and the [ellipsis](http://ux.stackexchange.com/questions/9544/what-is-the-significance-of-the-three-dots-on-menus-and-buttons-and-how-to) make more sense now.

Stay tuned to see what's up for the next update, follow me on [Twitter](http://twitter.com/dangercove) and [Facebook](http://facebook.com/dangercove).

You can read more about Porthole on [http://getporthole.com](http://getporthole.com).
