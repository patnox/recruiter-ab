<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\UserProfile */

$this->title = 'Update your profile: ' . Yii::$app->user->identity->username;
//$this->params['breadcrumbs'][] = ['label' => 'User Profiles', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="user-profile-update">

    <h3><?= Html::encode($this->title) ?></h3>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>


<div class="body-content">
	<div class="row">
		<div class="col-lg-4">
			<div class="my_admin_view admin_window_full">
				<center>
					<?php
						$profile_id = $model->id; 
						echo Html::a('EDIT LANGUAGES', ['/profilelanguage/index', 'profile_id' => $profile_id], ['class' => 'btn btn-lg btn-success']);
					?>
				</center>    
			</div>
		</div>
		<div class="col-lg-4">
			<div class="my_admin_view admin_window_full">
				<center>
					<?php
						$profile_id = $model->id; 
						echo Html::a('EDIT EDUCATION', ['/profileeducation/index', 'profile_id' => $profile_id], ['class' => 'btn btn-lg btn-success']);
					?>
				</center>    
			</div>
		</div>
		<div class="col-lg-4">
			<div class="my_admin_view admin_window_full">
				<center>
					<?php
						$profile_id = $model->id; 
						echo Html::a('EDIT EXPERIENCE', ['/profileexperience/index', 'profile_id' => $profile_id], ['class' => 'btn btn-lg btn-success']);
					?>
				</center>    
			</div>
		</div>
	</div>
</div>


