<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ProfileEducation */

$this->title = 'Update Education';
//$this->params['breadcrumbs'][] = ['label' => 'Profile Educations', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="profile-education-update">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'profile_id' => $profile_id,
        'model' => $model,
    ]) ?>

</div>
