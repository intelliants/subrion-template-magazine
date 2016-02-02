{if isset($featured_articles) && $featured_articles}
	<div class="ia-items featured-articles">
		{foreach $featured_articles as $article}
			<div class="ia-item-featured">
				<a class="ia-item-featured__image" href="{ia_url item='articles' type='url' data=$article text=$article.title}">
					{printImage imgfile=$article.image.path title=$article.title}
				</a>
				<div class="ia-item-featured__caption">
					<h3>{ia_url item='articlecats' data=$article text=$article.category_title}</h3>
					<h4>{ia_url item='articles' type='link' data=$article text=$article.title}</h4>
					<p><span class="fa fa-clock-o"></span> {lang key='on'} {$article.date_added|date_format:$core.config.date_format}</p>
					<p class="m-t">{$article.summary|strip_tags|truncate:150:'...':false}</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}