{if !('publishing_home' == $core.page.name && '1' != $category.id)}
	{if !empty($new_articles)}
		<div class="new-articles">
			<div class="row">
				{foreach $new_articles as $listing}
					<div class="col-md-3 col-sm-3">
						{include file='extra:publishing/list-articles-card'}
					</div>

					{if $listing@iteration % 4 == 0}
						</div>
						<div class="row m-t-md">
					{/if}
				{/foreach}
			</div>
		</div>
	{else}
		<div class="alert alert-info">{lang key='no_articles'}</div>
	{/if}
{/if}