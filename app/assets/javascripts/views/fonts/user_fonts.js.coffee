class Workshop.Views.UserFonts extends Backbone.View
	el: '#user_fonts'
	
	initialize: ->
		_.bindAll(@)
		console.log("model: "+@.model)
		@fetchCurrentUser()
		
	#events:
		
	
	fetchCurrentUser: =>
		@current_user = new Workshop.Models.Currentuser
		@current_user.fetch({ success: => @assignCurrentUser()) })
		
	assignCurrentUser: =>
		@persistent_user = new Workshop.Models.User({id: @current_user.id})
		@persistent_user.fetch()