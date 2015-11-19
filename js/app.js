$(function() {

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip({
		container: 'body'
	});

	//
	// Search
	// --------------------------------------------------

	$('.navbar-btn-search').click(function(e) {
		e.preventDefault();

		$(this).next().show().find('input').focus();
	});

	$(document).click(function(e) {
		if (!$(e.target).hasClass('navbar-btn-search') && !$('.navbar-btn-search').find(e.target).length && e.target.id != 'navSearch' && !$('#navSearch').find(e.target).length) {
			$("#navSearch").hide();
		}
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
});