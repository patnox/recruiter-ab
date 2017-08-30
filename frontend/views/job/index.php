<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\grid\GridView;
use yii\data\ActiveDataProvider;

/* @var $this yii\web\View */
/* @var $searchModel common\models\JobSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Job Search';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-index">

	<h3><?= Html::encode($this->title) ?></h3>

	<?php echo $this->render('_search', ['model' => $searchModel]); ?>
  
    <?= GridView::widget([
		'dataProvider' => $dataProvider,
		'columns' => [
				['class' => 'yii\grid\SerialColumn'],
				'title',
				'company',
				[ 
					'attribute' => 'category_id',
					'value' => function($model){
						$category = \common\models\Category::find()->where(['id' => $model->category_id])->one();
						return($category->name);
					}
				],
				[ 
					'attribute' => 'created_at',
					'value' => function($model){
						return(date("d-m-Y", strtotime($model->created_at)));
					}
				],
				[ 
					'attribute' => 'expires_at',
					'value' => function($model){
						return(date("d-m-Y", strtotime($model->expires_at)));
					}
				],
				[
					'class' => 'yii\grid\ActionColumn',
					'contentOptions' => ['style' => 'width:60px;'],
					'header'=>'Actions',
					'template'=>'{view}',
					'buttons' => [
						//view button
						'view' => function ($url, $model) {
							return Html::a('<span class="fa fa-view"></span>View', $url, [
										'title' => Yii::t('app', 'View'),
										'class'=>'btn btn-primary btn-xs',                                  
							]);
						},
					],
				],
		],
	]); ?>
</div>
