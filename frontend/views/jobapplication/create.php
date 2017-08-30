<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\JobApplication */

$this->title = 'Apply For This Job';
//$this->params['breadcrumbs'][] = ['label' => 'Job Applications', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-application-create">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'job_id' => $job_id,
		'user_id' => $user_id,
        'model' => $model,
    ]) ?>

</div>
