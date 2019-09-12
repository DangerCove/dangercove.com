---
layout: post
title: Fix "mapped file has no Team ID..." in Xcode 11
date: 2019-09-11
tags: [xcode]
description: "A quick fix for when you receive an error after applying the Xcode 11 GM's preferred settings."
canonical_url: "https://posts.boy.sh/fix-mapped-file-has-no-team-id-xcode"
---

After applying the preferred project settings in Xcode 11 you might be confronted with the following error while loading a Library at runtime:

```
dyld: Library not loaded: @rpath/DCOAboutWindow.framework/Versions/A/DCOAboutWindow
  Referenced from: /Users/username/Library/Developer/Xcode/DerivedData/Pipvid-adwfbkaurzovizgaarwkmugeihce/Build/Products/Debug/Pipvid.app/Contents/MacOS/Pipvid
  Reason: no suitable image found.  Did find:
	/Users/username/Library/Developer/Xcode/DerivedData/Pipvid-adwfbkaurzovizgaarwkmugeihce/Build/Products/Debug/Pipvid.app/Contents/MacOS/../Frameworks/DCOAboutWindow.framework/Versions/A/DCOAboutWindow: code signature in (/Users/username/Library/Developer/Xcode/DerivedData/Pipvid-adwfbkaurzovizgaarwkmugeihce/Build/Products/Debug/Pipvid.app/Contents/MacOS/../Frameworks/DCOAboutWindow.framework/Versions/A/DCOAboutWindow) not valid for use in process using Library Validation: mapped file has no Team ID and is not a platform binary (signed with custom identity or adhoc?)
```

The issue is caused by a new entry in your `project.pbxproj` that specifies the signing identity: `CODE_SIGN_IDENTITY = "-";`. It's set to _Sign to Run Locally_ by default.

Changing _Signing Certificate_ to _Development_ under _Signing Capabilities_ in the project settings resolves the issue. You could also manually update the entry to `CODE_SIGN_IDENTITY = "Apple Development";`.

![A screenshot showing that you should set 'Signing Certificate' to 'Development'](/assets/img/news/xcode-fix-mapped-file-has-no-team.jpg)

_Originally appeared on [posts.boy.sh](https://posts.boy.sh/fix-mapped-file-has-no-team-id-xcode)_
