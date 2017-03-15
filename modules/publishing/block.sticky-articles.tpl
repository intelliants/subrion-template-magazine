{if !empty($sticky_articles)}
	<div class="sec sec-sticky">
		<div class="container">
			<div class="owl-carousel sl">
				<div class="sl__slide">
					{foreach $sticky_articles as $article}
						<div class="sl__item" style="background-image: url('{ia_image file=$article.image title=$article.title type="large" url=true}');">
							<a class="sl__item__url" href="{ia_url item='articles' type='url' data=$article text=$article.title}"></a>
							<div class="sl__item__caption">
								<h3>{ia_url item='articlecats' data=$article text=$article.category_title}</h3>
								<h4>{ia_url item='articles' type='link' data=$article text=$article.title}</h4>
							</div>
						</div>

						{if $article@iteration % 3 == 0}
							</div>
							<div class="sl__slide">
						{/if}
					{/foreach}
				</div>
			</div>
		</div>
	</div>

	{ia_print_js files='_IA_TPL_owl.carousel.min'}
	{ia_add_js}
$(function () {
	$('.sl').owlCarousel({
		items: 1,
		dots: false,
		nav: true,
		navText: ['<span class="fa fa-chevron-left"></span>', '<span class="fa fa-chevron-right"></span>']
	})
})
	{/ia_add_js}
{/if}