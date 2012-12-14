class Workshop.Views.StylesNew extends Backbone.View

		el: "#content_wrapper"
		
		events:
			'click .font': 'updateTargetedFont'
			'click #header_unit': 'targetHeader'
			'click #subheader_unit': 'targetSubheader'
			'click #paragraph_unit': 'targetParagraph'
			'click #font_size li': 'updateTargetedFontSize'
			'click #save .btn': 'save'
			'click #reset a': 'reset'
			'click label': 'captureCSS'
			
		initialize: ->
			#bootstrap function for alert box
			$(".alert").alert()
			@style = new Workshop.Models.Style
			@stylizeUserFonts()
			@stylizeFontSize()
			@fetchCurrentUser()
			@fetchStyles()
			@target = $('#header_unit')
			_.bindAll @
		
# Initialize only

		stylizeUserFonts: ->
			$('.font').css 'font-family', () -> $(@).text()

		stylizeFontSize: ->
			$('#font_size li').css 'font-size', () -> $(@).text()
			$('#font_size li').css 'line-height', () -> $(@).text()

		fetchStyles: =>
			@styles = new Workshop.Collections.Styles
			@styles.fetch()

		fetchCurrentUser: =>
			@current_user = new Workshop.Models.CurrentUser
			@current_user.fetch({ success: => @assignCurrentUser() })

		assignCurrentUser: =>
			@persistent_user = new Workshop.Models.User({id: @current_user.id})
			@persistent_user.fetch()

# Save Style

		save: (ev) ->
			@captureCSS()
			@validate()
		
		captureCSS: ->
			@saveHash = {}
			
			@saveHash["name"] = $('#name_field').val()
			@saveHash["user_ids"] = @current_user.id 
			
		# Font Family
			@saveHash["h_font_family"] = $('#header_unit').css('font-family')
			@saveHash["sh_font_family"] = $('#subheader_unit').css('font-family')
			@saveHash["p_font_family"] = $('#paragraph_unit').css('font-family')

		# Font Size	
			@saveHash["h_font_size"] = $('#header_unit').css('font-size')
			@saveHash["sh_font_size"] = $('#subheader_unit').css('font-size')
			@saveHash["p_font_size"] = $('#paragraph_unit').css('font-size')

		# Font Style	
			@saveHash["h_font_style"] = $('#header_unit').css('font-style')
			@saveHash["sh_font_style"] = $('#subheader_unit').css('font-style')
			@saveHash["p_font_style"] = $('#paragraph_unit').css('font-style')

		# Line Height
			@saveHash["h_line_height"] = $('#header_unit').css('line-height')
			@saveHash["sh_line_height"] = $('#subheader_unit').css('line-height')
			@saveHash["p_line_height"] = $('#paragraph_unit').css('line-height')

		# Text Transform 
			@saveHash["h_text_transform"] = $('#header_unit').css('text-transform')
			@saveHash["sh_text_transform"] = $('#subheader_unit').css('text-transform')
			@saveHash["p_text_transform"] = $('#paragraph_unit').css('text-transform')
			console.log @saveHash
		
		validate: ->
			matches = @styles.where(@saveHash["name"])
			if matches.length > 0
				alert "That style name is taken. Pick a unique name"
			else
				console.log(@saveHash["name"])
				if _.isUndefined(@saveHash["name"])
					alert "Please give your style a name."
				else
					@postStyle()
		
		postStyle: -> @style.save( @saveHash, { url: '/styles', success: -> alert "Your style has been saved!" })
		
# Screen Behavior

		reset: (ev) =>
			ev.preventDefault()
			$('#paragraph_unit').css({'font-size': "10.5pt"});
			$('#paragraph_unit').css({'line-height': "20px"});
			$('#paragraph_unit').css({'font-family': "'Helvetica Neue', Helvetica, Arial, sans-serif"});
		
			$('#header_unit').css({'font-size': "39px"});
			$('#header_unit').css({'line-height': "40px"});
			$('#header_unit').css({'font-family': "'Helvetica Neue', Helvetica, Arial, sans-serif"});
			
			$('#subheader_unit').css({'font-size': "32px"});
			$('#subheader_unit').css({'line-height': "40px"});
			$('#subheader_unit').css({'font-family': "'Helvetica Neue', Helvetica, Arial, sans-serif"});
			
		updateTargetedFont: (ev) =>
			$(@target).css('font-family', $(ev.target).css('font-family'))
		
		updateTargetedFontSize: (ev) =>
			$(@target).css('font-size', $(ev.target).css('font-size'))
			if (@target).attr('id') == 'paragraph_unit'
				$(@target).css 'line-height', () ->
					
					(parseInt($(ev.target).css('font-size')[0..1])+1).toString()+'pt'
			else
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