<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */

class AppAsset extends AssetBundle
{
    public $sourcePath = '@vendor/almasaeed2010/';
    public $css = ['admin-lte/dist/css/AdminLTE.css'];
    public $js = ['admin-lte/dist/js/AdminLTE/app.js'];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
        'yii\bootstrap\BootstrapPluginAsset',
    ];
}
