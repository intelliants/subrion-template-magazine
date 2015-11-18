<div class="ia-item ia-item--{$listing.status}{if $listing.sponsored} ia-item--sponsored{/if}{if $listing.featured} ia-item--featured{/if} has-panel" id="article-{$listing.id}">
	{if $listing.image}
		<a class="ia-item__image" href="{ia_url type='url' item='articles' data=$listing}">
			{printImage imgfile=$listing.image.path title=$listing.title class='img-responsive'}
		</a>
	{/if}

	<div class="ia-item__labels">
		{if $member && $member.id == $listing.member_id && iaCore::STATUS_ACTIVE != $listing.status}
			<span class="label label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
		{/if}
		{if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
		{if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
	</div>

	<div class="ia-item__content">
		<div class="ia-item__actions">
			{printFavorites item=$listing itemtype='articles' guests=true}
			{accountActions item=$listing itemtype='articles'}
			{if !empty($listing.transaction_id)}
				<a rel="nofollow" href="{$smarty.const.IA_URL}pay/{$listing.transaction_id}/"><span class="fa fa-usd"></span> {lang key='pay'}</a>
			{/if}
			<a href="{ia_url item='articles' data=$listing type='url'}">{lang key='details'} <span class="fa fa-angle-double-right"></span></a>
		</div>

		<div class="ia-item__title">
			{ia_url item='articles' type='link' data=$listing text=$listing.title}
		</div>

		<div class="ia-item__additional">
			<p>
				{lang key='by'}
				{if $listing.account_username}
					<a href="{$smarty.const.IA_URL}member/{$listing.account_username}.html">{$listing.account_fullname}</a>
				{else}
					{lang key='guest'}
				{/if}
				{lang key='on'} {$listing.date_added|date_format:$core.config.date_format}
			</p>
			{if 'publishing_home' != $core.page.name && $listing.category_title}
				<p><span class="fa fa-folder"></span> <a href="{ia_url type='url' item='articlecats' data=$listing}">{$listing.category_title}</a></p>
			{/if}
			<p><span class="fa fa-eye"></span> {$listing.views_num} {if 1 == $listing.views_num}{lang key='view'}{else}{lang key='views'}{/if}</p>
		</div>

		<p>{$listing.summary} <a href="{ia_url type='url' item='articles' data=$listing}">{lang key='continue_reading'}</a></p>
	</div>
</div>