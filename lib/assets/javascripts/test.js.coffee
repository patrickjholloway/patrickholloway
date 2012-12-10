class Workshop.Test.Tester
	constructor: ->
		alert "This is how you can create a class outside of the backbone directory structure."
		console.log("Be sure to include the file in application.js")
		
		// in Backbone window object:
		// return testy = new Workshop.Test.Tester
		// this in application.js:
		//= require test