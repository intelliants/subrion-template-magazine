{if !empty($category.description)}
	<div class="slogan">{$category.description}</div>
{/if}

{if isset($categories) && $categories}
	<div class="ia-categories m-b">
		{include file='ia-categories.tpl' categories=$categories item='articlecats' show_amount=true num_columns=$core.config.categories_columns icons=$core.config.allow_icons}
	</div>
{/if}

{if isset($show['years'])}
	<table class="table table-bordered">
		{foreach $years as $y => $year}
			{if $year@first}<tr>{/if}
				<td>
					<h3 class="m-a-0"><a href="{$smarty.const.IA_SELF}{$y}/">{$y}</a></h3>
					<ul class="list-unstyled">
						{foreach $year.months as $m => $month}
							{if isset($month.articles)}
								<li><a href="{$smarty.const.IA_SELF}{$y}/{$m}/">{lang key=$month.name}</a></li>
							{else}
								<li>{lang key=$month.name}</li>
							{/if}
						{/foreach}
					</ul>
				</td>
			{if $year@iteration is div by 4}</tr><tr>{/if}
			{if $year@last}</tr>{/if}
		{/foreach}
	</table>
{/if}

{if isset($show['months'])}
	<table class="table table-bordered">
		{foreach $months as $m => $month}
			{if $month@first}<tr>{/if}
				<td>
					{if isset($month.articles)}
						<a href="{$smarty.const.IA_SELF}{$m}/">{lang key=$month.name}</a>
					{else}
						{lang key=$month.name}
					{/if}
				</td>
			{if $month@iteration is div by 4}</tr><tr>{/if}
			{if $month@last}</tr>{/if}
		{/foreach}
	</table>
{/if}

{if isset($articles) && $articles}
	{if !isset($articles_sorting) || $articles_sorting}
		<div class="ia-sorting">
			<form action="{$smarty.const.IA_SELF}" method="post" id="sort_form" class="form-inline pull-left m-0">
				{preventCsrf}
				<label>{lang key='sort_by'}:</label>
				<select name="sort_by" onchange="$('#sort_form').submit()" class="form-control">
					<option value="date_added-desc"{if $smarty.session.p_order == 'date_added-desc'} selected="selected"{/if}>{lang key='date_desc'}</option>
					<option value="date_added-asc"{if $smarty.session.p_order == 'date_added-asc'} selected="selected"{/if}>{lang key='date_asc'}</option>
					<option value="title-desc"{if $smarty.session.p_order == 'title-desc'} selected="selected"{/if}>{lang key='title_desc'}</option>
					<option value="title-asc"{if $smarty.session.p_order == 'title-asc'} selected="selected"{/if}>{lang key='title_asc'}</option>
					<option value="views_num-desc"{if $smarty.session.p_order == 'views_num-desc'} selected="selected"{/if}>{lang key='views_desc'}</option>
					<option value="views_num-asc"{if $smarty.session.p_order == 'views_num-asc'} selected="selected"{/if}>{lang key='views_asc'}</option>
				</select>
			</form>
		</div>
	{/if}

	<div class="ia-items">
		{foreach $articles as $listing}
			{include file='extra:publishing/list-articles'}
		{/foreach}
	</div>

	{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit}
{/if}