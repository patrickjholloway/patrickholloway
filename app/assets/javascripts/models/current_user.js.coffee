class Workshop.Models.CurrentUser extends Backbone.Model
	idAttribute: '_id'
	urlRoot: -> '/user/current_user/'