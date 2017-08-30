<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\Job */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-form">

    <?php $form = ActiveForm::begin(); ?>
	
	<?php 
        $category = \common\models\Category::find()->all(); 
        $listData=ArrayHelper::map($category,'id','name'); 
    ?>    
    <?= $form->field($model, 'category_id')->dropDownList($listData,['prompt'=>'Choose...']) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>
	
	<?= $form->field($model, 'company')->textInput(['maxlength' => true]) ?>
	
	<?= $form->field($model, 'salary')->textInput(['maxlength' => true]) ?>
	
	<?= $form->field($model, 'location')->textInput(['maxlength' => true]) ?>
	
	<?= $form->field($model, 'expires_at')->widget(\yii\jui\DatePicker::classname(), [
		'language' => 'en',
		'dateFormat' => 'dd-MM-yyyy',
		'value' => date("d-m-Y"),
	]) ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
