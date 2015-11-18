{if isset($priority_categories)}
	<div class="priority-cats">
		{foreach $priority_categories as $priority_category}
			<a href="{ia_url type='url' item='articlecats' data=$priority_category}"{if $priority_category.nofollow == '1'} rel="nofollow"{/if}>
				{$priority_category.title|escape:'html'}
				<span class="badge">{$priority_category.num}</span>
			</a>
		{/foreach}
	</div>
{/if}