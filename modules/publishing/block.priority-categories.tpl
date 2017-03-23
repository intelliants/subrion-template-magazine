{if isset($priority_categories)}
	{foreach $priority_categories as $priority_category}
		<h3{if !$priority_category@first} class="m-t-md"{/if}>
			<a href="{ia_url type='url' item='articlecats' data=$priority_category}"{if $priority_category.nofollow == '1'} rel="nofollow"{/if}>{$priority_category.title|escape}</a>
			<span class="badge">{$priority_category.num}</span>
		</h3>

		{if $priority_category.articles}
			<div class="ia-items">
				<div class="row">
					{foreach $priority_category.articles as $listing}
						<div class="col-md-3 col-sm-3">
							{include file='extra:publishing/list-articles-card'}
						</div>
					{/foreach}
				</div>
			</div>
		{/if}
	{/foreach}
{/if}