class Workshop.Views.StylesIndex extends Backbone.View
	el: "#css_attributes"
	
	events:
		'click #css_attributes': 'alert'
	
	alert: ->
		alert 2