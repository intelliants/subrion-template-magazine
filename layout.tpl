<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS {$core.config.version} - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{$core.page.nonProtocolUrl}favicon.ico">

		{ia_add_media files="jquery, subrion, js:bootstrap/js/bootstrap.min, css:iabootstrap-{$core.config.website_color}, css:user-style" order=0}
		{ia_print_js files='_IA_TPL_owl.carousel.min, _IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>

	<body class="page-{$core.page.name}{if $core.config.fixed_navbar} -fixed-navbar{/if}">
		<nav class="navbar navbar-default {if $core.config.fixed_navbar}navbar-fixed-top{/if}">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="{$smarty.const.IA_URL}">
						{if !empty($core.config.site_logo)}
							<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
						{else}
							<span>Magazine</span>
						{/if}
					</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-collapse">
					{ia_blocks block='account'}
					{include file='language-selector.tpl'}
					{ia_blocks block='mainmenu'}
				</div>
			</div>
		</nav>

		{if 'index' == $core.page.name}
			{ia_blocks block='slider'}
		{/if}

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}

		{include file='breadcrumb.tpl'}

		{if isset($iaBlocks.sponsored)}
			{ia_blocks block='sponsored'}
		{/if}

		{if isset($iaBlocks.verytop)}
			<div class="verytop">
				<div class="container">{ia_blocks block='verytop'}</div>
			</div>
		{/if}

		<div class="content">
			<div class="container">
				<div class="row">
					<div class="{width section='content' position='center' tag='col-md-'} center">
						<div class="content__wrap">
							{ia_hooker name='smartyFrontBeforeNotifications'}
							{include file='notification.tpl'}

							{ia_blocks block='top'}

							{if 'index' != $core.page.name}
								<div class="content__header">
									<h1 class="page-header">{$core.page.title}</h1>
									<ul class="content__actions">
										{foreach $core.actions as $name => $action}
											<li>
												{if 'action-favorites' == $name}
													{printFavorites item=$item itemtype=$item.item guests=true}
												{else}
													<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
														<span class="fa fa-{$name}"></span>
													</a>
												{/if}
											</li>
										{/foreach}
									</ul>
								</div>

								{ia_hooker name='smartyFrontBeforeMainContent'}

								{$_content_}

								{ia_hooker name='smartyFrontAfterMainContent'}
							{/if}

							{ia_blocks block='bottom'}
						</div>
					</div>

					<div class="{width section='content' position='right' tag='col-md-'} aside">
						{ia_blocks block='right'}
					</div>
				</div>
			</div>
		</div>

		{if isset($iaBlocks.verybottom)}
			<div class="sec sec-verybottom">
				<div class="container">{ia_blocks block='verybottom'}</div>
			</div>
		{/if}

		{if isset($iaBlocks.footer1) || isset($iaBlocks.footer2) || isset($iaBlocks.footer3) || isset($iaBlocks.footer4)}
			<div class="footer-blocks">
				<div class="container">
					<div class="row">
						<div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
						<div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
						<div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
						<div class="{width section='footer-blocks' position='footer4' tag='col-md-'}">{ia_blocks block='footer4'}</div>
					</div>
				</div>
			</div>
		{/if}

		<footer class="footer">
			<div class="container">
				{ia_hooker name='smartyFrontBeforeFooterLinks'}
				
				<div class="row">
					<div class="col-md-6">
						{ia_blocks block='copyright'}
						<p>{lang key='copyright_text'}</p>
					</div>
					<div class="col-md-6">
						{if $core.config.template_social}
							<div class="social">
								{if $core.config.template_social_t}<a class="twitter" href="{$core.config.template_social_t}" target="_blank"><span class="fa fa-twitter"></span></a>{/if}
								{if $core.config.template_social_f}<a class="facebook" href="{$core.config.template_social_f}" target="_blank"><span class="fa fa-facebook"></span></a>{/if}
								{if $core.config.template_social_g}<a class="google-plus" href="{$core.config.template_social_g}" target="_blank"><span class="fa fa-google-plus"></span></a>{/if}
								{if $core.config.template_social_y}<a class="youtube" href="{$core.config.template_social_y}" target="_blank"><span class="fa fa-youtube"></span></a>{/if}
							</div>
						{/if}
						<div class="copyright">
							<p>
								&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}
							</p>
							<p>
								<a class="back-to-top js-back-to-top" href="#"><span class="fa fa-angle-up"></span></a>
							</p>
						</div>
					</div>
				</div>

				{ia_hooker name='smartyFrontAfterFooterLinks'}
			</div>
		</footer>

		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include file='visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>