<!DOCTYPE html>
<html>
<head>
    <% base_tag %>
    {$MetaTags(false)}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <% require css(themes/app/client/dist/css/style.css) %>
    <% require javascript(themes/app/client/dist/js/script.js) %>
</head>
<body>
    <% include Header %>

    {$Layout}

    <% include Footer %>
</body>
</html>
