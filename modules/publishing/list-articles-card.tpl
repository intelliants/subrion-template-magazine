<div class="ia-item ia-item--card" id="article-{$listing.id}">
	{if $listing.image}
		<a class="ia-item__image" href="{ia_url type='url' item='articles' data=$listing}">
			{ia_image file=$listing.image title=$listing.title class='img-responsive' type='thumbnail'}
		</a>
	{/if}

	<div class="ia-item__content">
		<div class="ia-item__title">
			{ia_url item='articles' type='link' data=$listing text=$listing.title}
		</div>

		{if !isset($noSummary)}
			<p>{$listing.summary|truncate:100:'...':true}</p>
		{/if}
		<div class="ia-item__additional">
			<p>
				{lang key='on'} {$listing.date_added|date_format:$core.config.date_format}
			</p>
		</div>
	</div>
</div>