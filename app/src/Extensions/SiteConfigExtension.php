<?php

/**
 * SiteConfigExtension
 *
 * @package SwiftDevLabs\Extensions
 * @author Kong Jin Jie <jinjie@swiftdev.sg>
 */

namespace SwiftDevLabs\Extensions;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldList;
use SilverStripe\ORM\DataExtension;

class SiteConfigExtension extends DataExtension
{
    private static $has_one = [
        'Logo'          => Image::class,
        'AlternateLogo' => Image::class,
    ];

    private static $owns = [
        'Logo',
        'AlternateLogo',
    ];

    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldsToTab(
            'Root.Main',
            [
                UploadField::create(
                    'Logo'
                ),
                UploadField::create(
                    'AlternateLogo'
                ),
            ]
        );
    }
}
