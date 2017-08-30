<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel common\models\JobinvitationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Talent you have invited for interviews';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-invitation-index">

    <h3><?= Html::encode($this->title) ?></h3>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?//= Html::a('Create Job Invitation', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
	<?php
		//echo "Count " . $count;
		//var_dump($user);
		//die();
	?>
	
<?php Pjax::begin(); ?>    
<?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

			[ 
				'attribute' => 'user_id',
				'value' => function($model){
					$user = \common\models\Profile::find()->where(['user_id' => $model->user_id])->one();
					$username = $user->first_name . " " . $user->last_name;
					return($username);
				}
			],
            [ 
				'attribute' => 'job_id',
				'value' => function($model){
					$job = \common\models\Job::find()->where(['id' => $model->job_id])->one();
					return($job->title);
				}
			],
            //'invitation_date',
			[ 
				'attribute' => 'target_date',
				'value' => function($model){
					return(date("d-m-Y H:m", strtotime($model->target_date)));
				}
			],
            'target_venue',
            // 'type',
			[ 
				'attribute' => 'accepted',
				'value' => function($model){
					if($model->accepted == 0)
					{
						return("No");
					}
					elseif($model->accepted == 1)
					{
						return("Yes");
					}
					else
					{
						return("unknown");
					}
				}
			],

            [
				'class' => 'yii\grid\ActionColumn',
				'contentOptions' => ['style' => 'width:60px;'],
				'header'=>'Actions',
				'template'=>'{viewjob}  {viewtalent}',
				'buttons' => [
					//view button
					'viewjob' => function ($url, $model) {
						return Html::a('<span class="fa fa-viewjob"></span>View Job', $url, [
									'title' => Yii::t('app', 'View Job'),
									'class'=>'btn btn-primary btn-xs',                                  
						]);
					},
					//view talent button
					'viewtalent' => function ($url, $model) {
						return Html::a('<span class="fa fa-viewtalent"></span>View Talent', $url, [
									'title' => Yii::t('app', 'View Talent'),
									'class'=>'btn btn-primary btn-xs',                                  
						]);
					},
				],
				'urlCreator' => function ($action, $model, $key, $index) {
					if ($action === 'viewjob') {
						$url ='index.php?r=job/view&id=' . $model->job_id;
						return($url);
					}
					if ($action === 'viewtalent') {
						$url ='index.php?r=profile/view&id=' . $model->user_id;
						return($url);
					}
				}
			],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
