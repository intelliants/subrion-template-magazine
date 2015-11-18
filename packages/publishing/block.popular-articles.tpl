{if isset($popular_articles) && $popular_articles}
	<div class="ia-items popular-articles">
		{foreach $popular_articles as $article}
			<div class="ia-item">
				{if $article.image}
					<a class="ia-item__image ia-item__image--small" href="{ia_url type='url' item='articles' data=$article}">
						{printImage imgfile=$article.image.path title=$article.title class='img-responsive'}
					</a>
				{/if}
				<div class="ia-item__content">
					<h5 class="ia-item__title">{ia_url type='link' item='articles' data=$article text=$article.title}</h5>
				</div>
				<p>{$article.summary|strip_tags|truncate:150:'...':false}</p>
				<p class="text-fade-50"><span class="fa fa-eye"></span> {$article.views_num} {lang key='views'}</p>
			</div>
		{/foreach}
	</div>
{/if}