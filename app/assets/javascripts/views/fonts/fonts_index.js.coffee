class Workshop.Views.FontsIndex extends Backbone.View
	el: '#content_wrapper'
	
	initialize: ->
		@stylizeFonts()
		@fetchCurrentUser()
		@fetchFonts()
		_.bindAll(@)
		
	events:
		'mouseenter span': 'whiteIcon'
		'mouseleave span': 'blackIcon'
		'click span': 'addHideFont'

	whiteIcon: (e) =>
		$(e.target).children('.icon-plus').addClass('icon-white')
		
	blackIcon: (e) =>
		$(e.target).children('.icon-plus').removeClass('icon-white')
	
	stylizeFonts: ->	
		$('.font').css 'font-family', () -> $(this).text()
		
	addHideFont: (e) =>
		$('<li class=font-simple>'+$(e.target).text().trim()+'</li><div class="clearfix"></div>').appendTo('#user_fonts.span3 ul')
		$(e.target).hide()
		clickedFontName = $(e.target).text().trim()	
		userFonts = @persistent_user.get("font_ids")
		clickedFont = @fonts.where({name: clickedFontName })[0]
		userFonts.push clickedFont.attributes._id
		@persistent_user.set "font_ids", userFonts
		@persistent_user.save()
	
	assignCurrentUser: =>
		@persistent_user = new Workshop.Models.User({id: @current_user.id})
		@persistent_user.fetch()
		@model = @persistent_user

	fetchFonts: =>
		@fonts = new Workshop.Collections.Fonts
		@fonts.fetch()
	
	fetchCurrentUser: =>
		@current_user = new Workshop.Models.CurrentUser
		@current_user.fetch { success: => @assignCurrentUser() }
