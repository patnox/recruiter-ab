<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Job */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Jobs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-view">

    <h3><?= Html::encode($this->title) ?></h3>

    <p>
	<?php
		if($model->created_by == Yii::$app->user->id)
		{
	?>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
		
	<?php
		}
		else
		{
	?>
			<?= Html::a('Apply For This Job', ['jobapplication/apply', 'job_id' => $model->id], ['class' => 'btn btn-primary']) ?>
	<?php
		}
	?>
    </p>
	
	<?php
		$model->expires_at = date('d-m-Y', strtotime($model->expires_at));
		$model->created_at = date('d-m-Y', strtotime($model->created_at));
		$model->category_id = $category->name;
	?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            'category_id',
            'company',
			'salary',
			'location',
			'expires_at',
            'content:ntext',
            'created_at',
        ],
    ]) ?>

</div>
