<!DOCTYPE html>
<html lang="$ContentLocale">
    <head>
        <% if $SiteConfig.Title %>
            <title>$SiteConfig.Title: <%t SilverStripe\LoginForms.LOGIN "Log in" %></title>
            $Metatags(false).RAW
        <% else %>
            $Metatags.RAW
        <% end_if %>
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta name="color-scheme" content="light dark" />
        <% require css("silverstripe/admin: client/dist/styles/bundle.css") %>
        <% require css("silverstripe/login-forms: client/dist/styles/bundle.css") %>
        <% require css("silverstripe/login-forms: client/dist/styles/darkmode.css") %>
    </head>
    <body>
        <% include AppHeader %>

        <main class="login-form">
            <% if $Title %>
                <h2 class="login-form__title">$Title</h2>
            <% end_if %>

            <% if $Message %>
                <p class="login-form__message
                    <% if $MessageType && not $AlertType %>login-form__message--$MessageType<% end_if %>
                    <% if $AlertType %>login-form__message--$AlertType<% end_if %>"
                >
                    $Message
                </p>
            <% end_if %>

            <% if $Content && $Content != $Message %>
                <div class="login-form__content">$Content</div>
            <% end_if %>

            $Form
        </main>

        <footer class="silverstripe-brand">
            <div class="text-center">
                <p>Website Design &amp; Development by <a href="https://www.swiftdev.sg/">Swift DevLabs</a></p>

                <p>Powered By</p>
                <% include SilverStripeLogo %>
            </div>
        </footer>
    </body>
</html>
