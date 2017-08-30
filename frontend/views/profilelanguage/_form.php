<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProfileLanguage */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="profile-language-form">

    <?php $form = ActiveForm::begin(); ?>

    <?//= $form->field($model, 'profile_id')->textInput() ?>
	<?= $form->field($model, 'profile_id')->hiddenInput(['value'=> $profile_id])->label(false) ?>

    <?= $form->field($model, 'language_name')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
