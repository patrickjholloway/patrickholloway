class Workshop.Views.FontsIndex extends Backbone.View
	el: '#content_wrapper'
	
	initialize: ->
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
	
	addHideFont: (e) =>
		$(e.target).hide()
		clickedFontName = $(e.target).text().trim()	
		userFonts = @persistent_user.get("font_ids")
		clickedFont = @fonts.where({name: clickedFontName })[0]
		userFonts.push(clickedFont.attributes._id)
		@persistent_user.set("font_ids", userFonts)
		@persistent_user.save( {}, success: -> alert "success" )
	
	assignCurrentUser: =>
		@persistent_user = new Workshop.Models.User({id: @current_user.id})
		@persistent_user.fetch()	

	fetchFonts: =>
		@fonts = new Workshop.Collections.Fonts
		@fonts.fetch()
	
	fetchCurrentUser: =>
		@current_user = new Workshop.Models.Currentuser
		@current_user.fetch({ success: => @assignCurrentUser() })
