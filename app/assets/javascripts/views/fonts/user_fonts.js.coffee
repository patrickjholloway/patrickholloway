class Workshop.Views.UserFonts extends Backbone.View
	el: '#user_fonts'
	
	initialize: ->
		@template = JST['user_fonts']
		_.bindAll(@)
		@fetchCurrentUser()
		
	events:
		#'change': 'updateUserFonts' 
		'click .font-simple': 'updateUserFonts'
		
	render: ->
		$(@el).html @template
		return @
	
	updateUserFonts: =>
		@template = JST['user_fonts']({user_fonts: @user_fonts.attributes})
		@render()
	
	fetchCurrentUser: =>
		@current_user = new Workshop.Models.CurrentUser
		@current_user.fetch success: =>
			console.log "got user"
			@assignCurrentUser()
			@fetchUsersFonts()
	
	fetchUsersFonts: =>
		@user_fonts = new Workshop.Collections.CurrentUserFonts
		@user_fonts.fetch
			success: ->
				console.log "fetched fonts"
	assignCurrentUser: =>
		@persistent_user = new Workshop.Models.User({id: @current_user.id})
		@persistent_user.fetch
			success: =>
				console.log "assigned user"
				@setViewModel @persistent_user
		
	setViewModel: (user) ->
		@model = user
		
	