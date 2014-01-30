---
layout: post
title: "Grab content from a web browser in your Mac app"
date: 2014-01-27 15:43
comments: true
categories: [tapetrap, code, tutorials]
---

One of my favorite features of [Tapetra](http://www.dangercove.com/tapetrap) is its ability to add feeds to your collection while surfing the web with your browser. Instead of looking for the rss feed manually and copy-pasting the link, you can click a button and Tapetrap will find and add the feed for you. In this article I want to go over why I think that's awesome and how it works. The source code for the URL grabbing is [available on GitHub](https://github.com/DangerCove/DCOURLGrabber).

<div class="thumbnail">
<iframe width="100%" height="360" src="//www.youtube.com/embed/zzoGEhWTXRw?rel=0&vq=hd720" frameborder="0" allowfullscreen></iframe>
<div class="caption">
Adding feeds from your web browser in Tapetrap
</div>
</div>

<!-- more -->

## Not a browser plugin

I've [made](https://chrome.google.com/webstore/detail/treasure-chest-radio-3fm/geeoeokcenpaehoemkfdjfmnobopefck) and use a few browser extensions. They're neat little applications that take an insane amount of work to maintain. While some code can be shared you will need to tailer some parts of the extension for each browser specifical.

For Tapetrap I chose to make a system wide browser extension in the form of an icon in the menu bar that "just works" with the active web browser when clicked. This means users don't have to install anything extra for it to work and I don't have to create it for every browser specifically. I can't say I'm the first one to do something like this, but it works particularly well for Tapetrap.

Of course there are downsides to using this approach instead of going with a plugin. You probably won't be able to manipulate the DOM or execute other more context aware methods. For getting basic information, it's fine though.

## How grabbing works

This is where it gets a little technical. To make this work I combined a basic menu bar app with my own URL grabber code, called [DCOURLGrabber](https://github.com/DangerCove/DCOURLGrabber), to get the URL from the web browser that was last active.

I'll skip the menu bar icon part. There are plenty [good tutorial](http://kmikael.com/2013/07/01/simple-menu-bar-apps-for-os-x/)s that explain all you need. Instead I'll talk about how to interact with the web browser.

### AppleScript

Yep, AppleScript. Often used to automate tedious tasks, it's also a great way to interface with other applications. For DCOURLGrabber I focussed on getting the URL from the selected tab of key window of the web browser that was last active. Here's how that looks for Google Chrome:

``` applescript Grab URL From Chrome https://github.com/DangerCove/DCOURLGrabber/raw/master/AppleScripts/com.google.Chrome.scpt
tell application "Google Chrome"
  get URL of active tab of first window
end tell
```

Simple enough right? For Safari and Opera the command are very similar. The one for Firefox is a little longer.

``` applescript Grab URL From Firefox https://github.com/DangerCove/DCOURLGrabber/raw/master/AppleScripts/org.mozilla.firefox.scpt
tell application "Firefox" to activate
tell application "System Events"
  keystroke "l" using command down
  keystroke "c" using command down
end tell
delay 0.5
the clipboard
```

Hopefully they'll switch to a straightforward approach in a future update. In any case, you'll notice that after running these scripts you're presented with the URL.

### Objective-C

Getting this to run in Objective-C is simple. Create a new Mac project in XCode, paste in the next piece of code in the `applicationDidFinishLaunching:` method and you're done.

``` objective-c Get URL From Chrome in Objective-C
// The script to run. You could also load this from a file as in DCOURLGrabber
NSString *chromeScript =
@"tell application \"Google Chrome\"\n"
"  get URL of active tab of first window\n"
"end tell";

// Load the script
NSAppleScript *script = [[NSAppleScript alloc] initWithSource:chromeScript];
    
// Grab URL using AppleScript
NSDictionary *scriptExecuteError;
NSAppleEventDescriptor *result = [script executeAndReturnError:&scriptExecuteError];
if(scriptExecuteError) {

  // Failed
  NSLog(@"Error: %@", scriptExecuteError);

} else {

  NSLog(@"Output: %@", result.stringValue);

}
```

## Getting the RSS/Atom URL

Websites that value their feeds will link to it from their website. Not only via the well-known orange button, but also via a meta tag in the source code of the website. This apps like Tapetrap a way of retrieving it. 

## Real world example

You can [download Tapetrap](http://www.dangercove.com/tapetrap) to get a feel of how this works.