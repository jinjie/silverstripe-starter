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
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\ORM\DataExtension;
use SwiftDevLabs\Models\SocialMediaLink;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

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

    private static $has_many = [
        'SocialMediaLinks' => SocialMediaLink::class,
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
                GridField::create(
                    'SocialMediaLinks',
                    'Social Media Links',
                    $this->owner->SocialMediaLinks(),
                    GridFieldConfig_RecordEditor::create()
                        ->addComponent(new GridFieldOrderableRows())
                )
            ]
        );
    }
}
