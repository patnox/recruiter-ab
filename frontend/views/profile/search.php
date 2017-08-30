<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Talent Search';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-search">

    <h3><?= Html::encode($this->title) ?></h3>
	
    <?php echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [ 
				'attribute' => 'country_id',
				'value' => function($model){
                    $country = \common\models\Countries::find()->where(['id' => $model->country_id])->one();
					return($country->country_name);
                }
			],
            [ 
				'attribute' => 'dob',
				'value' => function($model){
					return(date("d-m-Y", strtotime($model->dob)));
                }
			],
            'expected_salary',
            'first_name',
            'last_name',

            ['class' => 'yii\grid\ActionColumn','template'=>'{view}'],
        ],
    ]); ?>
</div>
