---
layout: page 
title: "Learn How to Script Porthole"
date: 2012-09-07 14:58
comments: false
sharing: false
footer: true
status: done
back: /porthole
belongs_to: porthole 
---

Starting with version 1.7.0 Porthole is scriptable using Apple's AppleScript Editor (or Script Editor in Yosemite). This means that you can automate and toggle certain functions of Porthole without going through the interface.

## Index

1. [Use Cases](#use-cases)
1. [Getting Started](#getting-started)
1. [Advanced Tricks](#advanced)
1. [Notifications](#notifications)
1. [Reference](#reference)

<h2 id="use-cases">Use Cases</h2>

These are a few cases in which scripting could come in handy:

* Automatically connecting to a certain (or every) speaker on startup.
* Chaining several actions in one, such as: starting Spotify, playing a song and then connecting to all your AirPlay devices. You can put that in a single script.
* You could use it to develop a remote control.
* And obviously any case where you want to control Porthole without going through the interface.

<h2 id="getting-started">Getting Started</h2>

* [Download](/porthole/download) the latest version of Porthole, or make sure you're on version 1.7.0 or higher.
* Launch Porthole at least once and set it up.
* Start (Apple)Script Editor.app (find it in /Applications/Utilities/(Apple)Script Editor.app).

![Script Editor](/images/adventures/porthole/screenshots/05_applescripteditor.jpg)

When you have AppleScript Editor running, paste in the script below to get the name of the first speaker Porthole's found. Press the big green "Run" button when you're done.

``` AppleScript
tell application "Porthole"
  name of first speaker
end tell
```

As you were probably expecting, Porthole should now be connected to the first speaker it found. Pretty sweet!

<h2 id="advanced">Advancced Tricks</h2>

Say that you always want to connect to a certain speaker when your Mac boots up. There are a few things we need to do for this to work:

1. Get a unique identifier for our speaker.
1. Use that unique identifier to connect to the specific speaker.
1. Run the script on startup.

### Getting the Unique Identifier

Run this script:

``` AppleScript
tell application "Porthole"
  set output to "Speakers:\n"
  repeat with sp in speakers as list
    set output to output & id of sp & ": " & name of sp & "\n"
  end repeat
end tell
```

It should return something along the lines of this:

```
"Speakers: 
12AB34CD56EF: Boy & Auk's AirPort Express
FE65DC43BA21: AirPort Express
"
```

### Use the Unique Identifier

he first value is the MAC address and unique identifier of the speaker, we'll use this to pick out a specific speaker to connect to.Let's pick "Boy &amp; Auk's AirPort Express" in this case. Make sure you replace the id with the value that was returned on your Mac.

``` AppleScript
tell application "Porthole"
  set sp to (first speaker whose id is "12AB34CD56EF")
  if sp is not connected then
    connect to sp
  end if
end tell
```

And that's it, Porthole will only connect to that specific speaker. Run the script to test it.

### Run the Script on Startup

You can actually turn Scripts into Applications, which you can add to your Login Items. Perfect, exactly what we need. Before we do this though, lets make a tiny modification to our script.

``` AppleScript
tell application "Porthole"
  activate
  delay 10
  set sp to (first speaker whose id is "12AB34CD56EF")
  if sp is not connected then
    connect to sp
  end if
end tell
```

The 'activate' command will load Porthole if it isn't already running. Then the delay will give Porthole ten seconds to discover any available speakers. After that the script runs like it did before.

To turn this into an app, in (Apple)Script Editor, click File &rarr; Export... and in the dialog box that opens choose Application under File Format.

Save the file anywhere you like, but remember its location.

Finally, go into System Preferences and select Users &amp; Groups, then Login Items. Press the little + button and pick the Application you just created. Your script will now run at login!

<h2 id="notifications">Notifications</h2>

Version 1.7.1 and up.

Porthole sends out system wide notifications when an AirPlay speaker appears/disappears/connects/disconnects and when the computer speaker setting is toggled. This removes the need to poll for changes.

To receive these notifications, hook into the NSDistributedNotificationCenter event:

``` Objective-C
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePortholeSpeakerStateChanged:) name:@"com.dangercove.Porthole.SpeakerStateChanged" object:nil];
}

- (void)dealloc {
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handlePortholeSpeakerStateChanged:(NSNotification *)notification {
    NSLog(@"Speaker state changed:\n%@", notification.userInfo);
}
```

The notification's userInfo contains a dictionary with the current speaker setup:

``` Objective-C
{
    speakers =     (
                {
            connected = 1;
            macaddress = 12AB34CD56EF;
            name = "Danger Cove";
        },
                {
            connected = 1;
            macaddress = AB34CD56EF12;
            name = SandroTV;
        },
                {
            connected = 0;
            macaddress = FE65DC43BA21;
            name = "AirPort Express";
        }
    );
    useComputerSpeaker = 0;
}
```

<h2 id="reference">Reference</h2>

These are all the Porthole-specific commands you can use. For a more general AppleScript tutorial, have a look at [this guide](http://computers.tutsplus.com/tutorials/the-ultimate-beginners-guide-to-applescript--mac-3436).

### Speaker Related

<dl>
  <dt>speaker</dt>
  <dd>Addresses a single speaker. Properties: <i>id</i>, <i>name</i>, <i>connected</i>, <i>streaming</i>.</dd>
  <dt>every speaker</dt>
  <dd>Addresses all speakers.</dd>
  <dt>first|second|...|last speaker</dt>
  <dd>Addresses the first/second/etc speaker. You can also use speaker 1,2,3,etc.</dd>
  <dt>connect to [speaker(s)]</dt>
  <dd>Connect to the specified speaker(s).</dd>
  <dt>disconnect from [speaker(s)]</dt>
  <dd>Disconnect from the specified speaker(s).</dd>
</dl>

### General

<dl>
  <dt>use computer speaker [boolean]</dt>
  <dd>Enable or disable the (connected) computer speaker.</dd>
</dl>

This is a property. You can set like so:

``` AppleScript
tell application "Porthole"
  set use computer speaker to true -- or false
end tell
```
