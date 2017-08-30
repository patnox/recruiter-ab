<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\JobInvitation */

$this->title = 'Invite Talent';
//$this->params['breadcrumbs'][] = ['label' => 'Job Invitations', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-invitation-create">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
		'user_id' => $user_id,
		'job_id' => $job_id,
        'model' => $model,
    ]) ?>

</div>
