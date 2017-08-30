<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProfileexperienceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Experience';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-experience-index">

    <h3><?= Html::encode($this->title) ?></h3>
    <?php //echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Add Experience', ['create', 'profile_id' => $profile_id], ['class' => 'btn btn-success']) ?>
    </p>
    
	<?= GridView::widget([
        'dataProvider' => $experience,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'company',
			'profession',
			'date_from',
			'date_to',
            [
				'class' => 'yii\grid\ActionColumn',
				'contentOptions' => ['style' => 'width:60px;'],
				'header'=>'Actions',
				'template'=>'{update}  {delete}',
			],
        ],
    ]); ?>
</div>
