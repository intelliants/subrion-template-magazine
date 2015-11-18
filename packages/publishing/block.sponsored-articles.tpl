{if isset($sponsored_articles)}
	<div class="sponsored-articles">
		<div class="row">
			{foreach $sponsored_articles as $article}
				<div class="col-md-3 col-sm-3">
					<div class="ia-item ia-item--card ia-item--card-bg" id="article-{$article.id}">
						{if $article.image}
							<a class="ia-item__image" href="{ia_url type='url' item='articles' data=$article}">
								{printImage imgfile=$article.image.path title=$article.title class='img-responsive'}
							</a>
						{/if}

						<div class="ia-item__content">
							<div class="ia-item__title">
								{ia_url item='articles' type='link' data=$article text=$article.title}
							</div>

							<p>{$article.summary|truncate:100:'...':true}</p>
							<div class="ia-item__additional">
								<p>
									<span class="fa fa-clock-o"></span> {$article.date_added|date_format:$core.config.date_format}
								</p>
							</div>
						</div>
					</div>
				</div>

				{if $article@iteration % 4 == 0}
					</div>
					<div class="row m-t">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}