+++
draft = true
description = ""
date = "2017-02-06T23:24:05-08:00"
title = "little tweaks to ui and ux"
tags = ["",""]
categories = [""]

+++
There were a couple things i didn't like that i wanted to fix

- Fix getting passed waiting for mouseover.  Ideally I would like the graph to show when you scroll
- Make it look a little better


The first one took a little bit, but i found a nice shortcut.  The text of the link matches the "title" of the article. Well, that is mostly true, Aparantly there are a bunch of articles that put a " | Author" at the end, or a " | publisher" at the end of their title in the Article.  But if that was the case then how did facebook actually get the real title? I bet they weren't custom splitting on the "|".  Then i found some extra meta tags that mostly worked as well. This required me switching the API to use a string for the Title, which also couldn't even have the "|" otherwise that would break my API call for some reason. But in the end it now works pretty well.  Now, the overlay in the feed will be there as you scroll to it. which is nice.

But how does it look? well i decided to keep the same style as this site.  Pink on Black with white font.  Here is an example:

![Overlay](/images/overlay3.png)

There is still lots to do, like

- updating the style of the Ranker
- ranking within the feed, for things like videos
- filters for your feed based on preferences in the chrome extensions
- oh and doing stuff to get people to use it.... but maybe the screenshots can get more people excited.
