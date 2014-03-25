#= require "_helper"

# requirejs makes life a lot easier when dealing with more than one
# javascript file and any sort of dependencies, and loads faster.

# for more info on require config, see http://requirejs.org/docs/api.html#config
require.config
	paths:
		jquery: 'jquery'

require ['jquery'], ($) ->
	moveLeft = (element, delta) ->
		currLeft = parseInt $(element).css('left').substring(-2)
		$(element).css 'left', currLeft+delta

	getDiff = (a, b) ->
		($(a).offset().left + $(a).width()/2) - ($(b).offset().left + $(b).width()/2)

	changeDisplay = (newDisplay) ->
		# console.log "removing", window.current;
		$(window.current).removeClass('visible')
		$('.content').css 'height', $('#topic-'+newDisplay).css('height')
		setTimeout(() ->
			window.current = '#topic-'+newDisplay
			# console.log "setting", window.current
			$(window.current).addClass('visible')
		, 500)

	window.current = null
	#Page initialization
	if(window.location.hash)
		window.current = '#topic-'+window.location.hash.substring(1)
		# console.log "Initialized as", current
		moveLeft '.tab-arrow', getDiff('#tab-'+window.location.hash.substring(1), '.tab-arrow')
		$(window.current).addClass('visible')
		$('.content').css 'height', $(window.current).css('height')
	else
		window.current = '#topic-iOS'
		$(window.current).addClass('visible')
		moveLeft '.tab-arrow', getDiff('.tab-item:first-child', '.tab-arrow')
		$('.content').css 'height', $('#topic-iOS').css('height')

	$('.tab-item').click (e) ->
		moveLeft '.tab-arrow', getDiff(this, '.tab-arrow')
		changeDisplay $(this).data('topic')