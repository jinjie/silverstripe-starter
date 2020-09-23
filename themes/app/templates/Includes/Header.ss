<header>
    <div class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a href="{$BaseHref}" class="navbar-brand">
            <% if $SiteConfig.Logo %>
                {$SiteConfig.Logo.ScaleHeight(40)}
            <% else %>
                {$SiteConfig.Title}
            <% end_if %>
        </a>

        <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#primary-navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="primary-navigation">
            <ul class="navbar-nav ml-auto">
                <% loop $Menu(1) %>
                    <li class="nav-item <% if $isCurrent || $isSection %>active<% end_if %>">
                        <a href="{$Link}" title="Navigate to {$Title.XML}" class="nav-link">{$MenuTitle}</a>
                    </li>
                <% end_loop %>
            </ul>
        </div>
    </div>
</header>
