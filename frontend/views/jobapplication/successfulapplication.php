<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel common\models\JobapplicationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Successful Application';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-application-index">

    <h3><?= Html::encode($this->title) ?></h3>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?//= Html::a('Create Job Application', ['create'], ['class' => 'btn btn-success']) ?>
		<div class="jumbotron">
			<p class="lead">You Have Successfully Applied For the Job</p>
			<p><a class="btn btn-lg btn-success" href="index.php?r=job/index">More Jobs</a></p>
		</div>
    </p>
</div>
