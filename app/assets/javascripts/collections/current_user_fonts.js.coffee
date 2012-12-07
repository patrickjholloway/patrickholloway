class Workshop.Collections.CurrentUserFonts extends Backbone.Model
	model: Workshop.Models.Font,
	url: -> '/user/current_user_fonts/'