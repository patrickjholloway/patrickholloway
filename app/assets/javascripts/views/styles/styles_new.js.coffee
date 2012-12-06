class Workshop.Views.StylesNew extends Backbone.View

		el: "#content_wrapper"
		
		initialize: ->
			@style = new Workshop.Models.Style
			@stylizeUserFonts()
			@stylizeFontSize()
			@fetchCurrentUser()
			@fetchFonts()
			@target = $('#header_unit')
			_.bindAll(@)
		
		events:
			'click .font': 'updateTargetedFont'
			'click #header_unit': 'targetHeader'
			'click #subheader_unit': 'targetSubheader'
			'click #paragraph_unit': 'targetParagraph'
			'click #font_size li': 'updateTargetedFontSize'
		
		stylizeUserFonts: ->
			$('.font').css 'font-family', () -> $(@).text()
		
		stylizeFontSize: ->
			$('#font_size li').css 'font-size', () -> $(@).text()
			$('#font_size li').css 'line-height', () -> $(@).text()
		
		updateTargetedFont: (ev) =>
			$(@target).css('font-family', $(ev.target).css('font-family'))
		
		updateTargetedFontSize: (ev) =>
			$(@target).css('font-size', $(ev.target).css('font-size'))
			$(@target).css('line-height', $(ev.target).css('font-size'))
			@clickFeedback(ev.target)
			
		clickFeedback: (target) ->
			$(target).animate({backgroundColor: '#ddd'}, 20, () -> $(@).animate({backgroundColor: '#fff'}, 1000, 'easeOutQuad'))
	
		# Targeting
		
		targetParagraph: ->
			@target = $('#paragraph_unit')
			@clickFeedback('#paragraph_unit')
		
		targetSubheader: ->
			@target = $('#subheader_unit')
			@clickFeedback('#subheader_unit')
		
		targetHeader: ->
			@target = $('#header_unit')
			@clickFeedback('#header_unit')
			
		fetchFonts: =>
			@fonts = new Workshop.Collections.Fonts
			@fonts.fetch()

		fetchCurrentUser: =>
			@current_user = new Workshop.Models.Currentuser
			@current_user.fetch({ success: => @assignCurrentUser() })
		
		assignCurrentUser: =>
			@persistent_user = new Workshop.Models.User({id: @current_user.id})
			@persistent_user.fetch()