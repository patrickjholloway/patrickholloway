window.Workshop =
	Models: {}
	Collections: {}
	Views: {}
	new_style:
		initialize: ->
			view = new Workshop.Views.StylesNew
			
	fonts:
		initialize:->
			$('.font').css('font-family', () -> $(this).text())
			view = new Workshop.Views.FontsIndex