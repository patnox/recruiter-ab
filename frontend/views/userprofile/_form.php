<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\UserProfile */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-profile-form">

    <?php $form = ActiveForm::begin(); ?>

    <?//= $form->field($model, 'user_id')->textInput() ?>
	<?= $form->field($model, 'user_id')->hiddenInput(['value'=> Yii::$app->user->id])->label(false) ?>

	<?= $form->field($model, 'first_name')->textInput() ?>
	
	<?= $form->field($model, 'last_name')->textInput() ?>
	
	<?= $form->field($model, 'address')->textInput() ?>
	
	<?php 
		$model->user_id = Yii::$app->user->id;
        $country = \common\models\Countries::find()->all(); 
        $countryData=ArrayHelper::map($country,'id','country_name'); 
    ?>    
    <?= $form->field($model, 'country_id')->dropDownList($countryData,['prompt'=>'Choose...']) ?>
    <?//= $form->field($model, 'country_id')->textInput() ?>

	<?= $form->field($model, 'dob')->widget(\yii\jui\DatePicker::classname(), [
		'language' => 'en',
		'dateFormat' => 'dd-MM-yyyy',
		'value' => date("Y-m-d"),
	]) ?>

    <?//= $form->field($model, 'dob')->textInput() ?>

    <?= $form->field($model, 'expected_salary')->textInput() ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
