<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\JobInvitation */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-invitation-form">

    <?php $form = ActiveForm::begin(); ?>

    <?//= $form->field($model, 'user_id')->textInput() ?>
	<?= $form->field($model, 'user_id')->hiddenInput(['value'=> $user_id])->label(false) ?>

    <?//= $form->field($model, 'job_id')->textInput() ?>
	<?= $form->field($model, 'job_id')->hiddenInput(['value'=> $job_id])->label(false) ?>

    <?//= $form->field($model, 'invitation_date')->textInput() ?>
	<?= $form->field($model, 'invitation_date')->hiddenInput(['value'=> date('Y-m-d')])->label(false) ?>

    <?//= $form->field($model, 'target_date')->textInput() ?>
	<?= $form->field($model, 'target_date')->widget(\yii\jui\DatePicker::classname(), [
		'language' => 'en',
		'dateFormat' => 'dd-MM-yyyy',
		'value' => date("d-m-Y"),
	]) ?>

    <?= $form->field($model, 'target_venue')->textInput(['maxlength' => true]) ?>
	
	<?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?//= $form->field($model, 'type')->textInput() ?>

    <?//= $form->field($model, 'accepted')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Send Invitation' : 'Update Invitation', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
