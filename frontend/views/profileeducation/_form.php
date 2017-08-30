<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProfileEducation */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="profile-education-form">

    <?php $form = ActiveForm::begin(); ?>

    <?//= $form->field($model, 'profile_id')->textInput() ?>
	<?= $form->field($model, 'profile_id')->hiddenInput(['value'=> $profile_id])->label(false) ?>

    <?= $form->field($model, 'institution')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'course')->textInput(['maxlength' => true]) ?>

    <?//= $form->field($model, 'date_from')->textInput() ?>
	<?= $form->field($model, 'date_from')->widget(\yii\jui\DatePicker::classname(), [
		'language' => 'en',
		'dateFormat' => 'dd-MM-yyyy',
		'value' => date("Y-m-d"),
	]) ?>

    <?//= $form->field($model, 'date_to')->textInput() ?>
	<?= $form->field($model, 'date_to')->widget(\yii\jui\DatePicker::classname(), [
		'language' => 'en',
		'dateFormat' => 'dd-MM-yyyy',
		'value' => date("Y-m-d"),
	]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
