<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ProfileEducation */

$this->title = 'Add Education';
//$this->params['breadcrumbs'][] = ['label' => 'Profile Educations', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-education-create">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'profile_id' => $profile_id,
        'model' => $model,
    ]) ?>

</div>
