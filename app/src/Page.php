<?php

namespace {

    use SilverStripe\CMS\Model\SiteTree;
    use SwiftDevLabs\Models\SocialMediaLink;

    class Page extends SiteTree
    {
        private static $db = [];

        private static $has_one = [];

        public function getSocialMediaLinks()
        {
            return SocialMediaLink::get();
        }
    }
}
