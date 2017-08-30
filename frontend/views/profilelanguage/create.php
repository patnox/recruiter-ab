<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ProfileLanguage */

$this->title = 'Add Language';
//$this->params['breadcrumbs'][] = ['label' => 'Profile Languages', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-language-create">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'profile_id' => $profile_id,
        'model' => $model,
    ]) ?>

</div>
