+++
draft = true
description = ""
date = "2017-01-29T18:43:03-08:00"
title = "exploring how this could work"
tags = ["",""]
categories = [""]

+++

Ok I devoted my entire weekend to get a prototype working.
# This was the plan.
- Build an API that can do the following:
  - Receive POSTS to accept rankings of 5 dimensions for any article
  - Return GET requests that take a url and return the aggregation of rankings for that url
  - The Get requests need to be quite performant and should be able to handle Caching, and user throttling
  - I do not want to manage any servers, this will all run without any servers (AWS)

- Build a chrome extension that can do the following:
  - That can read your facebook news feed, and return the results for the article in your feed and overlay the aggregation of the results from the API
  - Identify when you are reading an article and allow an overlay for you to submit the ranking to the API while reading it

I started by exploring how to make a Chrome Extension.  Following some basic tutorials, I found out the chrome extensions are qutie awesome.  They are simple Javascript sites that have simple browser code that allows injecting Javascript on any page.  This was perfect, just what i needed, the next thing i needed was to be able to get the URLS out of the page.  This was not so easy.  When facebook loads the news feed page the anchor tags did not contain the urls of the article.  And even after using hacky techniques like setInterval, the url still wouldnt be populated.  It was only right after when a user mouses over the article in the feed did the url get populated. From that point, I was able to make an overlay. Its not the nicest thing in the world. But the point is that it was doable.
![Overlay](/images/overlay.png)

Cool so the UI can work in the facebook feed.  However, it means that everytime a user mouseovers an article in the facebook news i need to fire a call to the API, and render quite quickly. Noted.  Ok, onto the API

I basically did everything with Amazon Web Services.  It took a while getting everything wired together.  Route53, for getting my domain name and DNS; Amazone API Gateway for generating tokens, throttling and caching; Amazon Lambda to take the request and do some simple math logic; DynamoDB for storing all data; Oh and S3 for storing and hosting this site.  Connecting these things was not that easy, one of the things that caught me was getting SSL certificates right.  Majority of the weekend was devoted to configuring and tweaking my lambda function. Which does some cool iterative standard deviation calculations.

Ok with the facebook news feed overlay, and the API, I needed to get the article submissions working.  In order to get this to work the chrome extension needed to find a way to determine whether the page being viewed was an article or not.  Fortunately I was able to find a way using the meta tags in the page that (mostly) works. I then use a some simple js sliders for the form, and tada.
![Overlay](/images/overlay2.png)

It does work with a couple little bugs i need to fix.  It was exhausting.  And well worth it.  After some bug fixing, Some test users. and i think we have something.
