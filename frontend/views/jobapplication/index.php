<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel common\models\JobapplicationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Your Job Applications';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-application-index">

    <h3><?= Html::encode($this->title) ?></h3>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?//= Html::a('Create Job Application', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
	
<?php Pjax::begin(); ?>    
	<?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

			[ 
				'attribute' => 'job_id',
				'value' => function($model){
					$job = \common\models\Job::find()->where(['id' => $model->job_id])->one();
					return($job->title);
				}
			],
			[ 
				'attribute' => 'application_date',
				'value' => function($model){
					return(date("d-m-Y", strtotime($model->application_date)));
				}
			],
			[ 
				'attribute' => 'invited',
				'value' => function($model){
					if($model->invited == 0)
					{
						return("No");
					}
					elseif($model->invited == 1)
					{
						return("Yes");
					}
					else
					{
						return("unknown");
					}
				}
			],
            // 'cover_letter:ntext',
            // 'type',

            [
				'class' => 'yii\grid\ActionColumn',
				'contentOptions' => ['style' => 'width:60px;'],
				'header'=>'Actions',
				'template'=>'{view}',
				/**
				'template'=> function ($model) {
					if($model->invited == 0)
					{
						return('{view}');
					}
				},
				**/
				'buttons' => [
					//view button
					'view' => function ($url, $model) {
						return Html::a('<span class="fa fa-view"></span>View', $url, [
									'title' => Yii::t('app', 'View'),
									'class'=>'btn btn-primary btn-xs',                                  
						]);
					},
					//accept button
					'accept' => function ($url, $model) {
						return Html::a('<span class="fa fa-accept"></span>Accept', $url, [
									'title' => Yii::t('app', 'Accept'),
									'class'=>'btn btn-primary btn-xs',                                  
						]);
					},
					//decline button
					'decline' => function ($url, $model) {
						return Html::a('<span class="fa fa-decline"></span>Decline', $url, [
									'title' => Yii::t('app', 'Decline'),
									'class'=>'btn btn-primary btn-xs',                                  
						]);
					},
				],
				'urlCreator' => function ($action, $model, $key, $index) {
					if ($action === 'view') {
						$url ='index.php?r=job/view&id=' . $model->job_id;
						return($url);
					}
					if ($action === 'accept') {
						$url ='index.php?r=jobapplication/accept&id=' . $model->id;
						return($url);
					}
					if ($action === 'decline') {
						$url ='index.php?r=jobapplication/decline&id=' . $model->id;
						return($url);
					}
				}
			],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
