---
layout: post
title: "Migrating away from DevMate: redirecting Sparkle updates"
date: 2019-09-13
tags: [infrastructure]
description: "DevMate will retire its service in December, so I setup redirects for my Sparkle update feeds."
---

DevMate is the service I use to gather download and install statistics for most of my apps. It also serves the update feeds for all non-Mac App Store apps. Earlier this year [DevMate announced its retiring the platform](https://announcement.devmate.com) in December.

![A screenshot of my DevMate dashboard, showing about 50 downloads and 30 installs for Timeless in the past 30 days and 100 downloads and 60 installs for Pipvid](/assets/img/news/devmate-dashboard.jpg)

In this post I'll outline how I'm preparing my apps to migrate to a new update feed. Christian Tietze mentions [asking DevMate to point the Sparkle update feed to a new location](https://christiantietze.de/posts/2019/09/devmate-feed-redirect/). He also recommends to not rely on DevMate's redirect to work forever. That's where my approach comes in.

I urge you to take control over the feed URL entirely and redirect it yourself. [DevMateKit](https://github.com/DevMate/DevMateKit) uses [Sparkle](https://sparkle-project.org) under the hood. This means a custom update URL can be specified by implementing a Sparkle delegate method.

### Setting the URL

```swift
class ApplicationCoordinator: NSObject, Coordinator {

  ...
  
  private func configureUpdates() {
    DM_SUUpdater.shared().delegate = self
  }
}

extension ApplicationCoordinator: DM_SUUpdaterDelegate_DevMateInteraction {
    func feedURLString(for updater: DM_SUUpdater) -> String? {
        if Defaults.shared.isEnabled(setting: .betaUpdates) {
            return .appcastBetaURLString
        } else {
            return .appcastURLString
        }
    }
}

extension String {
    static let appcastURLString = "https://updates.dangr.co/\(Bundle.main.bundleIdentifier!)/appcast.xml"
    static let appcastBetaURLString = "https://updates.dangr.co/\(Bundle.main.bundleIdentifier!)/beta-appcast.xml"
}
```

After this change [Timeless](/timeless) will check for updates at `updates.dangr.co`. I can set redirects for this domain however I want. 

### Redirecting

I use [Netlify](https://www.netlify.com) to handle [the redirects](https://github.com/DangerCove/updates.dangr.co/blob/master/_redirects). Here's what that looks like:

```
com.dangercove.Timeless.Mac/appcast.xml*      https://updates.devmate.com/com.dangercove.Timeless.Mac.xml:splat       301
com.dangercove.Timeless.Mac/beta-appcast.xml* https://updates.devmate.com/beta/com.dangercove.Timeless.Mac.xml:splat  301
```

As you can see I currently redirect to the feed at DevMate, but I can redirect it anywhere else whenever I want. This allows me to use DevMate for as long as possible and switch to any other service that uses Sparkle. I'm keeping a close eye on [App Center by Microsoft](https://appcenter.ms). They put Sparkle feeds for macOS on [the roadmap for September](https://github.com/microsoft/appcenter/issues/202).
