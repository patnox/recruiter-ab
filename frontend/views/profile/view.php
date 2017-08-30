<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Profile */

$this->title = "Profile of: " . $model->first_name;
//$this->params['breadcrumbs'][] = ['label' => 'Profiles', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-view">

    <h3><?= Html::encode($this->title) ?></h3>

	<?php
		//You cannot invite yourself for an interview
		if($model->user_id != Yii::$app->user->id)
		{
	?>
			<p>
				<?= Html::a('Invite For Interview', ['jobinvitation/invite', 'profile_id' => $model->id], ['class' => 'btn btn-primary']) ?>
			</p>
	<?php
		}
	?>
	
	<?php
		$country = \common\models\Countries::find()->where(['id' => $model->country_id])->one();
		$model->country_id = $country->country_name;
		$model->dob = date("d-m-Y", strtotime($model->dob));
	?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'country_id',
			'first_name',
			'last_name',
			'address',
            'dob',
            'expected_salary',
            'description:ntext',
        ],
    ]) ?>

</div>
