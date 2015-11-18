$(function() {

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip({
		container: 'body'
	});

	//
	// Utils
	// --------------------------------------------------

	$('.modal').appendTo('body');


	//
	// Back to top
	// --------------------------------------------------

	$('.js-back-to-top').on('click', function(e) {
		e.preventDefault();

		$('html, body').animate({
			scrollTop: 0
		}, 'fast');
	})

	//
	// Custom checkbox
	// --------------------------------------------------

	var $customChecks = $('.c-checkbox');

	$customChecks.each(function() {
		var $this = $(this).find('input'),
			$parent = $this.parent(),
			$icon = $parent.find('.fa');

		if ($this.prop('checked')) {
			$icon.removeClass('fa-square').addClass('fa-check-square')
		} else {
			$icon.removeClass('fa-check-square').addClass('fa-square')
		}
	});

	$customChecks.on('change', 'input', function () {
		var $this = $(this),
			$parent = $this.parent(),
			$icon = $parent.find('.fa');

		if ($this.prop('checked')) {
			$icon.removeClass('fa-square').addClass('fa-check-square')
		} else {
			$icon.removeClass('fa-check-square').addClass('fa-square')
		}
	});



	//
	// Layout for cards RESERVED FOR FUTURE
	// --------------------------------------------------

	// $('.js-toggle-layout').on('click', function(e) {
	// 	e.preventDefault();

	// 	var $this = $(this),
	// 		layout = $this.data('layout'),
	// 		$cards = $('.ia-cards__items');

	// 	$this.addClass('active').siblings().removeClass('active');
	// 	$cards.removeClass('-list -grid').addClass('-' + layout);

	// 	intelli.cookie.write('cardsLayout', layout, 30, intelli.config.baseurl.replace(window.location.origin, ''));
	// });



	//
	// View page: move author and tools after car info
	// --------------------------------------------------

	var mq = function(query, callback, usePolyfill) {
	    var host = {};
	    var isMatchMediaSupported = !!(window && window.matchMedia) && !usePolyfill;
	    if(isMatchMediaSupported) {
	        var res = window.matchMedia(query);
	        callback.apply(host, [res.matches, res.media]);
	        res.addListener(function(changed) {
	            callback.apply(host, [changed.matches, changed.media]);
	        });
	    } else {
	        console.log('IE its you! Go home IE! You are drunk!');
	    }
	}

	if ($('.page-realestate_view').length) {
		mq('(max-width: 768px)', function(match) {
		    if (match) {
		    	var $b = $('.content .aside');

		    	$b.insertAfter($b.next());
		    }
		});
	}
});