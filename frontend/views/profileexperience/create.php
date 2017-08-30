<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ProfileExperience */

$this->title = 'Add Experience';
//$this->params['breadcrumbs'][] = ['label' => 'Profile Experiences', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-experience-create">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'profile_id' => $profile_id,
        'model' => $model,
    ]) ?>

</div>
