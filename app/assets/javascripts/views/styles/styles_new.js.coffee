class Workshop.Views.StylesNew extends Backbone.View

		el: "#content_wrapper"
		
		initialize: ->
			@fetchCurrentUser()
			@fetchFonts()
			@customFonts()
			@target = $('#header_unit')
			_.bindAll(@)
		
		events:
			'click .font': 'changeTargetedFont'
			'click #header_unit': 'targetHeader'
			'click #subheader_unit': 'targetSubheader'
			'click #paragraph_unit': 'targetParagraph'
		
		customFonts: ->
			$('.font').css('font-family', () -> $(@).text())
		
		changeTargetedFont: (ev) =>
			$(@target).css('font-family', $(ev.target).css('font-family'))
		
		targetParagraph: ->
			@target = $('#paragraph_unit')
		
		targetSubheader: ->
			@target = $('#subheader_unit')
		
		targetHeader: ->
			@target = $('#header_unit')
			
		fetchFonts: =>
			@fonts = new Workshop.Collections.Fonts
			@fonts.fetch()

		fetchCurrentUser: =>
			alert 1
			@current_user = new Workshop.Models.Currentuser
			@current_user.fetch({ success: => @assignCurrentUser() })
		
		assignCurrentUser: =>
			@persistent_user = new Workshop.Models.User({id: @current_user.id})
			@persistent_user.fetch()