class Workshop.Views.StylesIndex extends Backbone.View
	el: "#style_list"
	
	initialize: ->
		@fetchStyles()
		@stylizeFonts()
		@stylizeSize()
		_.bindAll @
		
	events:
		'click .disclosure': 'toggle_drawer'
		
	fetchStyles: =>
		@styles = new Workshop.Collections.Styles
		@styles.fetch()
		
	render: ->
		$(@el).html @template
		return @
		
	toggle_drawer: ->
		$('.drawer').toggle('slideDown')
	
	stylizeFonts: ->
		$('.style hgroup h1').css 'font-family', () -> $(@).parent().parent().find('.h_font').text().trim()	
		$('.style h2').css 'font-family', () -> $(@).parent().parent().find('.sh_font').text().trim()	
		$('.style p.preview').css 'font-family', () -> $(@).parent().parent().find('.p_font').text().trim()	
		
	stylizeSize: ->
		$('#font_size li').css 'font-size', () -> $(@).text().trim()	
		$('#font_size li').css 'line-height', () -> $(@).text().trim()
