<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\JobApplication */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-application-form">

    <?php $form = ActiveForm::begin(); ?>

    <?//= $form->field($model, 'user_id')->textInput() ?>
	<?= $form->field($model, 'user_id')->hiddenInput(['value'=> $user_id])->label(false) ?>

    <?//= $form->field($model, 'job_id')->textInput() ?>
	<?= $form->field($model, 'job_id')->hiddenInput(['value'=> $job_id])->label(false) ?>

    <?//= $form->field($model, 'application_date')->textInput() ?>
	<?= $form->field($model, 'application_date')->hiddenInput(['value'=> date('Y-m-d')])->label(false) ?>

    <?//= $form->field($model, 'invited')->textInput() ?>

    <?= $form->field($model, 'cover_letter')->textarea(['rows' => 6]) ?>

    <?//= $form->field($model, 'type')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Send Application' : 'Update Application', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
