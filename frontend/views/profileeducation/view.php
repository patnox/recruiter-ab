<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ProfileEducation */

$this->title = "Education";
//$this->params['breadcrumbs'][] = ['label' => 'Profile Educations', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-education-view">

    <h3><?= Html::encode($this->title) ?></h3>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
	
	<?php
		$model->date_from = date('d-m-Y', strtotime($model->date_from));
		$model->date_to = date('d-m-Y', strtotime($model->date_to));
	?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'institution',
            'course',
            'date_from',
            'date_to',
        ],
    ]) ?>

</div>
