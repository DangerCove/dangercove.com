---
layout: post
title: "Tracking Knowledge Base Articles"
date: 2013-05-23 15:51
comments: true
categories: [insights, analytics]
---

It's very easy to setup analytics on your website. Put a piece of Javascript from Google on your website and you're pretty much set; every visit gets logged. But what if you want to track something specific. I realize that _really_ setting up Google Analytics is a craft and by no means do I imply that this is advanced stuff, but I still want to share a situation where I took the time to make Google Analytics work for me, and people using my apps.

<!-- more -->

I use [Uservoice](http://uservoice.com) to manage tickets for [Porthole](http://porthole.uservoice.com), [AirVLC](http://airvlc.uservoice.com) and [other Danger Cove apps](http://dangercove.uservoice.com). Something that works very well when managing support calls, is to setup a [knowledge base](http://porthole.uservoice.com/knowledgebase) for questions that get asked more than once. First and foremost because it will help people out even faster than I can respond to their email. Questions like: "Will this work on my Mac?" and "If I buy Porthole, how will I get it?" are perfect for a knowledge base. The answer is similar for everyone and it's something that you want to know _now_, instead of in an hour. The huge downside however, is that I don't get the chance to interact with my customer. This goes double for questions that have similar solutions for everyone, but when asked a lot might indicate an underlying problem that could be fixed in an update.

When I store these answers in a knowledge base, I need a way to see how often they're accessed. Ignoring it would would reduce support calls, but leave me with a _very_ unconfortable feeling, not knowing how many people experience which problems using my apps. How do we go about this? Uservoice has some built-in analytics that'll give you a general overview, but because I chose to [show knowledge base articles on the product pages](http://getporthole.comsupport) as well, I need something extra.

<div class="thumbnail">
  {% img /images/content/porthole-support.png "Porthole Support" %}
  <div class="caption">
  You can click on the titles to open and close the full articles
  </div>
</div>

That's where Google Analytics comes in. I could just link to different pages per article, but that would make it a lot harder to quickly scan multiple articles for answers. Like countless other sites, the solution I went with shows the title of every article and clicking it will unfold the answer. The only thing I need is an overview of which of these titles get clicked most. Easy right? It is actually. [Events](https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide) make this ridiculously easy. Simply trigger an event and Google Analytics will track it. This is what that looks like in Javascript.

{% codeblock Track support article in Javascript lang:javascript https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide Source %}
_gaq.push(['_trackEvent', 'Support', 'Open article_107729', 'article_107729']);
{% endcodeblock %}

Or if you prefer to just make the call inline.

{% codeblock Track support article in Javascript, inline lang:javascript https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide Source %}
<a href="#" onclick="_gaq.push(['_trackEvent', 'Support', 'Open article_107729', 'article_107729']);">Article title</a>
{% endcodeblock %}

These events fire every time someone opens (or closes; I log that separately) an article. What I end up with is a nice overview of which topics get consulted the most!

<div class="thumbnail">
  {% img /images/content/porthole-support-overview.jpg "Porthole Support Overview" %}
  <div class="caption">
  Overview of knowledge base events
  </div>
</div>

This still doesn't beat communicating via email, but it makes sure that I can at least determine where to focus my attention.
