<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ProfileExperience */

$this->title = 'Update Experience';
//$this->params['breadcrumbs'][] = ['label' => 'Profile Experiences', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="profile-experience-update">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'profile_id' => $profile_id,
        'model' => $model,
    ]) ?>

</div>
