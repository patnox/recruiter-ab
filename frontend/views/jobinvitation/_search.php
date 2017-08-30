<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\JobinvitationSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-invitation-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'user_id') ?>

    <?= $form->field($model, 'job_id') ?>

    <?= $form->field($model, 'invitation_date') ?>

    <?= $form->field($model, 'target_date') ?>

    <?php // echo $form->field($model, 'target_venue') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'accepted') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
