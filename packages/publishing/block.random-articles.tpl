{if isset($random_articles) && $random_articles}
	<div class="random-articles">
		<div class="row">
			{foreach $random_articles as $listing}
				<div class="col-md-2 col-sm-2">
					{include file='extra:publishing/list-articles-card' noSummary=true}
				</div>

				{if $listing@iteration % 6 == 0}
					</div>
					<div class="row m-t-md">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}