# Patrick Holloway's Resume App

This is a place for me to put some basic code and relevant recruiting information on display for prospective employers. The bulk of my experience so far has been on a web application that is still in active development and isn't mine to show off to the world. While I am job hunting, I still need *something* to show CTOs, hiring managers, and recruiters.

The code is very simple, as I only have a few hours to build it, but you can see that I am comfortable with Ruby on Rails and associated technologies.

In this project I incorporate the following:

-	Ruby on Rails
-	Twitter Bootstrap
-	SASS
-	HAML
-	javascript
-	jQuery
-	git/github
-	Heroku
- PostrgreSQL via Active Record
- various ruby gems

On a basic level, this demonstrates that I not only know the individual technologies, but how to incorporate them to make clean, reusable, and readable code.

I am not a seasoned developer, but an up and coming, self-taught guy eager to learn more.

The "Demo" section of the site is the next on the plate, seeing as the rest of the site is essentially serving up static pages. I'm hoping to incorporate something that captures the power of rails, demonstrates some front-end skills with jQuery and AJAX, and ties in a restful web API.

You can look at the code in progress by cloning the demo-app branch. Please keep mind there are a lot of things I've pulled in to the app that generated boilerplate would need to be weeded out, stuff to be refactored, and there are no tests.

Right now I am working on adding a backbone.js layer that takes over AJAX events on a few user interface elements that I want to be more dynamic. These days relying on rails and jQuery for AJAX doesn't cut it. I think we are starting to see the need to remove the Action View layer of Rails and have our view layer taken over by thick-client systems like Ember.js.

While things are being sorted out, especially when working with brownfield apps, Backbone provides a great tool to selectively add rich AJAX user interfaces where it's appropriate in your application. I am using coffee-haml templates, this makes it easier to cut and paste from my Action View haml templates.