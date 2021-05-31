<!DOCTYPE html>
<html lang="{$ContentLocale}">
<head>
    <% base_tag %>
    {$MetaTags(false)}

    <title>{$Title} - {$SiteConfig.Title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <% require css(themes/app/client/dist/css/style.css) %>
    <% require javascript(themes/app/client/dist/js/script.js) %>
</head>
<body class="{$ClassName.ShortName}<% if $ID %> {$ClassName.ShortName}-{$ID}<% end_if %> {$URLSegment}">
    <% include Header %>

    {$Layout}

    <% include Footer %>
</body>
</html>
