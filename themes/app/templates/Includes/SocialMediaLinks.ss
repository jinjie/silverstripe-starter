<% if $SocialMediaLinks %>
    <ul class="nav justify-content-center mt-3">
        <% loop $SocialMediaLinks %>
            <li class="nav-item mx-1">
                <a href="{$Link}" class="btn btn-sm btn-light" target="_blank">
                    <i class="fab {$SocialClass}"></i>
                </a>
            </li>
        <% end_loop %>
    </ul>
    <% require css(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css) %>
<% end_if %>
