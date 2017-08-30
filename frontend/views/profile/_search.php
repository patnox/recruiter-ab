<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\ProfileSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['search'],
        'method' => 'get',
    ]); ?>

    <?//= $form->field($model, 'id') ?>

    <?//= $form->field($model, 'user_id') ?>

    <?//= $form->field($model, 'country_id') ?>
	<?php 
        $country = \common\models\Countries::find()->all(); 
        $listData=ArrayHelper::map($country,'id','country_name'); 
    ?>    
    <?= $form->field($model, 'country_id')->dropDownList($listData,['prompt'=>'Choose...']) ?>

	<?= $form->field($model, 'description') ?>
    <?//= $form->field($model, 'dob') ?>

    <?//= $form->field($model, 'expected_salary') ?>

    <?php // echo $form->field($model, 'description') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
