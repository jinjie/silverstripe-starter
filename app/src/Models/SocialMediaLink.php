<?php

/**
 * SocialMediaLink
 *
 * @package SwiftDevLabs\Models
 * @author Kong Jin Jie <jinjie@swiftdev.sg>
 */

namespace SwiftDevLabs\Models;

use SilverStripe\Core\Config\Configurable;
use SilverStripe\Forms\DropdownField;
use SilverStripe\ORM\DataObject;
use SilverStripe\SiteConfig\SiteConfig;
use gorriecoe\Link\Models\Link;

class SocialMediaLink extends DataObject
{
    use Configurable;

    private static $table_name = 'SocialMediaLink';

    private static $db = [
        'SocialClass' => 'Varchar(20)',
        'Link'        => 'Varchar(200)',
        'Title'       => 'Varchar(50)',
        'Sort'        => 'Int',
    ];

    private static $field_labels = [
        'SocialClass' => 'Social Media',
    ];

    private static $has_one = [
        'SiteConfig' => SiteConfig::class,
    ];

    private static $default_sort = 'Sort ASC';

    private static $social_media_sites = [];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->replaceField(
            'SocialClass',
            DropdownField::create(
                'SocialClass',
                'Social Media'
            )->setSource($this->getSocialMediaSites())
        );

        $fields->removeByName('Title');
        $fields->removeByName('Sort');
        $fields->removeByName('SiteConfigID');

        return $fields;
    }

    public function onBeforeWrite()
    {
        parent::onBeforeWrite();

        $this->Title = $this->getSocialMediaSites()[$this->SocialClass];
    }

    public function getSocialMediaSites()
    {
        return $this->config()->get('social_media_sites');
    }
}
