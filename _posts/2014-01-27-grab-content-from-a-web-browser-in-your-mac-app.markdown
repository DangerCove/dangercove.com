---
layout: post
title: "Grab content from a web browser in your Mac app"
date: 2014-01-27 15:43
comments: true
tags: [tapetrap, tutorials, open source]
---

One of my favorite features of [Tapetrap](http://www.dangercove.com/tapetrap) is its ability to subscribe to a website while surfing the web with your browser. Instead of looking for the RSS feed manually and copy-pasting the link, you can click a button and Tapetrap will find and add the feed for you. In this article I want to go over why I think that's awesome and how it works. The source code for the URL grabbing is [available on GitHub](https://github.com/DangerCove/DCOURLGrabber).

<iframe width="620" height="349" src="//www.youtube.com/embed/zzoGEhWTXRw?rel=0&amp;vq=hd720" allowfullscreen></iframe>

*Adding feeds from your web browser in Tapetrap*

<!-- more -->

## Not a browser plugin

I've [made](https://chrome.google.com/webstore/detail/treasure-chest-radio-3fm/geeoeokcenpaehoemkfdjfmnobopefck) and use a few browser extensions. They're neat little applications that take an insane amount of work to maintain. While some code can be shared you will need to tailer parts of the extension for each browser specifically.

For Tapetrap, I chose to make a system wide browser extension in the form of an icon in the menu bar that "just works" with the active web browser when clicked. This means users don't have to install anything extra and I don't have to create a plugin per browser. I can't say I'm the first one to do something like this, but it works particularly well for Tapetrap.

![Add feeds while surfing the web](/assets/img/old/content/tapetrap-ss-menubar.jpg)

Of course there are downsides to using this approach too. It's impossible to manipulate the DOM inside the browser or execute other more context aware methods. It's fine for getting basic information, though.

## How grabbing works

This is where it gets a little technical. I combined a basic menu bar app with my own URL grabber code, called [DCOURLGrabber](https://github.com/DangerCove/DCOURLGrabber), to get the URL from the web browser that was last active.

I'll skip the menu bar icon part. There are plenty of [good tutorial](http://kmikael.com/2013/07/01/simple-menu-bar-apps-for-os-x/)s that explain all you need. Instead I'll talk about how to interact with the web browser.

### AppleScript

Yep, AppleScript. Often used to automate tedious tasks, it's also a great way to interface with other applications. For DCOURLGrabber I focussed on getting the URL from the selected tab of the key window of the web browser that was last active. This is the AppleScript for getting the URL in Google Chrome:

``` applescript 
tell application "Google Chrome"
  get URL of active tab of first window
end tell
```

Simple enough right? For [Safari and Opera](https://github.com/DangerCove/DCOURLGrabber/tree/master/AppleScripts) the command are very similar. The one for Firefox is a little longer.

``` applescript 
tell application "Firefox" to activate
tell application "System Events"
  keystroke "l" using command down
  keystroke "c" using command down
end tell
delay 0.5
the clipboard
```

Hopefully they'll switch to a straightforward approach in a future update. In any case, after running these scripts they present the current URL of the browser window.

### Objective-C

To run this in Objective-C, create a new Mac project in XCode, paste in the next piece of code in the `applicationDidFinishLaunching:` method and that's it.

``` objc
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

Using DCOURLGrabber it becomes even easier. Check the [GitHub page](https://github.com/DangerCove/DCOURLGrabber) for more documentation.

``` objc
DCOURLGrabber *grabber = [[DCOURLGrabber alloc] init];
NSURL *url = [grabber grabURLFromBundleID:@"com.google.Chrome" withError:&grabError];
if(grabError) {
    NSLog(@"Failed to retrieve URL: %@", grabError);
} else {
    NSLog(@"Got URL: %@", url.absoluteString);
}
```

## Getting the RSS/Atom URL

Websites that value their feeds will link to it from their website. Not only with the well-known orange button, but also through a meta tag in the source code of the website. This gives apps like Tapetrap a way of retrieving it.

The GameKings website has this setup correctly. Inspecting the source of [http://gamekings.tv](http://gamekings.tv) reveals the following lines near the top of the document.

```
<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://www.gamekings.tv/feed/" />
<link rel="alternate" type="text/xml" title="RSS .92" href="http://www.gamekings.tv/feed/rss/" />
<link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="http://www.gamekings.tv/feed/atom/" />
<link rel="alternate" type="application/rss+xml" title="Gamekings Video's RSS Feed" href="http://www.gamekings.tv/rss?cat=3">
<link rel="alternate" type="application/rss+xml" title="Gamekings Nieuws RSS Feed" href="http://www.gamekings.tv/rss?cat=18">
```

All links point to RSS feeds. There are some similarities between the lines. Using these conventions, it's easy to extract them in code. Even easier with [OCGumbo](https://github.com/tracy-e/OCGumbo), which is a HTML5 parser. It converts RSS into Objective-C objects.

The following lines of code parse a simple HTML page, check the 'type' parameter of the 'link' meta tag for either application/rss+xml, application/atom+xml, rss+xml or atom+xml and log the link when it matches.

``` objc
// Create an array that contains the strings that can appear in the 'type' property
NSArray *linkTypeFeedIndicators = [NSArray arrayWithObjects:@"application/rss+xml", @"application/atom+xml", @"rss+xml", @"atom+xml", nil];

NSString *htmlString =
@"<html><head>"
"<link rel='alternate' type='application/rss+xml' title='RSS 2.0' href='http://www.gamekings.tv/feed/' />"
"</head><body>"
"<h1>Feed discovery experiment</h1>"
"<p>Just testing ;).</p>"
"</body></html>";

// Load the document from a string containing HTML
OCGumboDocument *document = [[OCGumboDocument alloc] initWithHTMLString:htmlString];
OCGumboElement *root = document.rootElement;

// Loop through all 'link' tags
[root.Query(@"link") enumerateObjectsUsingBlock:^(OCGumboElement *element, NSUInteger idx, BOOL *stop) {
    NSString *type = [element.attr(@"type") stringByRemovingNewLinesAndWhitespace];
    
    // Check if the type is equal to that of a RSS/Atom feed
    if([linkTypeFeedIndicators containsObject:type]) {
        NSString *feedURLString = element.attr(@"href");
        NSLog(@"Found a feed: %@", feedURLString);
    }
}];
```

With the URL of the RSS feed in hand, the road is clear to analyze its content using a RSS parser, or maybe use the URL for something different entirely.

## Real world example

You can [download Tapetrap](http://www.dangercove.com/tapetrap) to get a feel of how this works. The app is now in public beta and free to use. Also let me know what you think and help improve it!
