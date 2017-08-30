<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProfileeducationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Education';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-education-index">

    <h3><?= Html::encode($this->title) ?></h3>
    <?php //echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Add Education', ['create', 'profile_id' => $profile_id], ['class' => 'btn btn-success']) ?>
    </p>
	
	<?php
		//$model->date_from = date('d-m-Y', strtotime($model->date_from));
		//$model->date_to = date('d-m-Y', strtotime($model->date_to));
	?>
	
    <?= GridView::widget([
        'dataProvider' => $education,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'institution',
			'course',
			'date_from',
			'date_to',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
