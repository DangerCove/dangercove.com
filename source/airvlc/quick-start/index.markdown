---
layout: page
title: "Reign Developers"
date: 2013-02-06 20:32
comments: false
sharing: false
footer: false
banner: /images/adventures/reign/header.jpg
back: /reign
---

It's really easy to create your own theme for Reign, or even your own native client for iOS or Android. Just follow these simple guidelines and endpoints to get started.

## Themes

After enabling 'Advanced Theming' in Reign's preferences. Reign will copy the contents of the default theme to ~/Reign/Spotify/Themes/Default.

Use your favorite editor to customize the html/css/javascript of the theme.

Notice: updates for Reign might add/change functionality, requiring a manual update of your theme.

## Bonjour

Reign broadcasts its server under a specific server type: ```_reign._tcp.```.

Browsing servers using NSNetServiceBrowser:

```objectivec
NSNetServiceBrowser *netServiceBrowser = [[NSNetServiceBrowser alloc] init];
[netServiceBrowser setDelegate:self];
[netServiceBrowser searchForServicesOfType:@"_reign._tcp." inDomain:@"local."];
```

Handle discovered services in the delegate methods:

```objectivec
- (void)netServiceBrowser:(NSNetServiceBrowser *)sender didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing {
	// Start resolving etc.
}
```

Read more about [NSNetServiceBrowser](https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNetServiceBrowser_Class/Reference/Reference.html).

## Endpoints

Every Reign instance runs a web server that responds to several endpoints. For instance: /index.html will return the standard remote control.

### /playpause

Toggle's the Spotify player state between playing and paused.

Parameters: none

Returns: nothing

### /next

Skips to the next track.

Parameters: none

Returns: nothing

### /previous

Skips to the previous track.

Parameters: none

Returns: nothing

### /status

Returns the current Spotify client status. Containing now-playing information etc.

Parameters: none

Returns:

<dl>
    <dt>state</dt>
    <dd>playing/paused/off</dd>
    <dt>volume</dt>
    <dd>client volume</dd>
    <dt>album</dt>
    <dd>current album</dd>
    <dt>position</dt>
    <dd>position in track in seconds</dd>
    <dt>now_playing</dt>
    <dd>combined track title and artist</dd>
    <dt>starred</dt>
    <dd>boolean indicating if the track is starred</dd>
    <dt>allow_force</dt>
    <dd>true if the server allows play/pause/next/prev commands</dd>
    <dt>url</dt>
    <dd>Spotify url for the current track</dd>
    <dt>track_id</dt>
    <dd>Spotify track id</dd>
    <dt>cover</dt>
    <dd>base64 encoded jpg containing the cover art</dd>
    <dt>duration</dt>
    <dd>track duration in seconds</dd>
    <dt>arist</dt>
    <dd>track artist</dd>
    <dt>name</dt>
    <dd>track title</dd>
  </dl>
