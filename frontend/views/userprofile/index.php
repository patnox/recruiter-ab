<?php
use yii\helpers\Html;
use yii\widgets\ListView;
use yii\widgets\DetailView;
use yii\bootstrap\Button;
use yii\helpers\ArrayHelper;
use yii\grid\GridView;
use yii\data\ActiveDataProvider;

/* @var $this yii\web\View */
/* @var $searchModel common\models\UserProfileSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::$app->name . '- User Profile';
$this->params['breadcrumbs'][] = $this->title;
?>

<center><h3><?php echo Html::encode(Yii::$app->name); ?> User Profile</h3></center>

<?php
	if(!Yii::$app->user->isGuest) 
	{
            //if($this->beginCache('blogTagCloud', array('duration'=>1))) 
            {
?>
                <h4><center><?php echo("Welcome: " . Html::encode(Yii::$app->user->identity->username) . "</b>"); ?></center></h4>
				<div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php
							echo("First Name: <b>" . Html::encode($model->first_name) . "</b>"); 
						?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("LastName: <b>" . Html::encode($model->lastname). "</b>"); ?>
                    </div>
                </div>
				<div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php
							echo("Last Name: <b>" . Html::encode($model->last_name) . "</b>"); 
						?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("LastName: <b>" . Html::encode($model->lastname). "</b>"); ?>
                    </div>
                </div>
				<div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php
							echo("Address: <b>" . Html::encode($model->address) . "</b>"); 
						?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("LastName: <b>" . Html::encode($model->lastname). "</b>"); ?>
                    </div>
                </div>
                <div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php
							echo("Country: <b>" . Html::encode($country->country_name) . "</b>"); 
						?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("LastName: <b>" . Html::encode($model->lastname). "</b>"); ?>
                    </div>
                </div>
                <div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php echo("Date Of Birth: <b>" . Html::encode(date("d-m-Y", strtotime($model->dob))) . "</b>"); ?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("Phone: <b>" . Html::encode($model->phone_number). "</b>"); ?>
                    </div>
                </div>
                <div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php echo("Expected Salary: <b>" . Html::encode($model->expected_salary) . "</b>"); ?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("Address: <b>" . Html::encode($model->address). "</b>"); ?>
                    </div>
                </div>
                <div class="profile_line_separator container form-group">
                    <div class="profile_line_left">
                        <?php echo("Profile Summary: <b>" . Html::encode($model->description) . "</b>"); ?>
                    </div>
                    <div class="profile_line_right">
                        <?php //echo("Last Visit: <b>" . Html::encode(date("d-m-Y H:i:s", Yii::app()->user->data()->lastvisit)). "</b>"); ?>
                    </div>
                </div>
				
				<?php
					if($languages)
					{
						$languageData=ArrayHelper::map($languages,'id','language_name');
				?>
						<div class="profile_line_separator container form-group">
							<div class="profile_line_left">
								<?php echo("<b>Languages:</b>"); ?>
							</div>
							<div class="profile_line_right">
								<?php //echo("Last Visit: <b>" . Html::encode(date("d-m-Y H:i:s", Yii::app()->user->data()->lastvisit)). "</b>"); ?>
							</div>
						</div>
				<?php
						$langcounter = 1;
						foreach($languageData as $language)
						{
				?>
							<div class="profile_line_separator container form-group">
								<div class="profile_line_left">
									<?php echo("" . $langcounter . ". <b>" . Html::encode($language) . "</b>"); ?>
								</div>
								<div class="profile_line_right">
									<?php //echo("Last Visit: <b>" . Html::encode(date("d-m-Y H:i:s", Yii::app()->user->data()->lastvisit)). "</b>"); ?>
								</div>
							</div>
				<?php
							$langcounter++;
						}
					}
				?>
				
				<?php
					if($education)
					{
						$profilemodel = $model;
				?>
						<div class="profile_line_separator container form-group">
							<div class="profile_line_left">
								<?php echo("<b>Education:</b>"); ?>
							</div>
							<div class="profile_line_right">
								<?php //echo("Last Visit: <b>" . Html::encode(date("d-m-Y H:i:s", Yii::app()->user->data()->lastvisit)). "</b>"); ?>
							</div>
						</div>
				<?php
						//$edcounter = 1;
						//foreach($education as $school)
						//{
				?>
							<?= GridView::widget([
								'dataProvider' => $education,
								'columns' => [
										['class' => 'yii\grid\SerialColumn'],
										'institution',
										'course',
										[ 
											'attribute' => 'date_from',
											'value' => function($model){
												return(date("d-m-Y", strtotime($model->date_from)));
											}
										],
										[ 
											'attribute' => 'date_to',
											'value' => function($model){
												return(date("d-m-Y", strtotime($model->date_to)));
											}
										],
										[
											'class' => 'yii\grid\ActionColumn',
											'contentOptions' => ['style' => 'width:60px;'],
											'header'=>'Actions',
											'template'=>'{update}  {delete}  {create}',
											'buttons' => [
												//create button
												'create' => function ($url, $model) {
													return Html::a('<span class="fa fa-plus"></span>Create', $url, [
																'title' => Yii::t('app', 'Create'),
																'class'=>'btn btn-primary btn-xs',                                  
													]);
												},
											],
											'urlCreator' => function ($action, $model, $key, $index) use ($profilemodel) {
												if ($action === 'update') {
													$url ='index.php?r=profileeducation/update&id=' . $model->id;
													return($url);
												}
												if ($action === 'delete') {
													$url ='index.php?r=profileeducation/delete&id=' . $model->id;
													return($url);
												}
												if ($action === 'create') {
													$url ='index.php?r=profileeducation/create&profile_id=' . $profilemodel->id;
													return($url);
												}
											}
										],
								],
							]); ?>
				<?php
							//$edcounter++;
						//}
					}
				?>
				
				<?php
					if($experience)
					{
				?>
						<div class="profile_line_separator container form-group">
							<div class="profile_line_left">
								<?php echo("<b>Experience:</b>"); ?>
							</div>
							<div class="profile_line_right">
								<?php //echo("Last Visit: <b>" . Html::encode(date("d-m-Y H:i:s", Yii::app()->user->data()->lastvisit)). "</b>"); ?>
							</div>
						</div>
				<?php
						//$excounter = 1;
						//foreach($experience as $company)
						//{
				?>
							<?= GridView::widget([
								'dataProvider' => $experience,
								'columns' => [
										['class' => 'yii\grid\SerialColumn'],
										'company',
										'profession',
										[ 
											'attribute' => 'date_from',
											'value' => function($model){
												return(date("d-m-Y", strtotime($model->date_from)));
											}
										],
										[ 
											'attribute' => 'date_to',
											'value' => function($model){
												return(date("d-m-Y", strtotime($model->date_to)));
											}
										],
										[
											'class' => 'yii\grid\ActionColumn',
											'contentOptions' => ['style' => 'width:60px;'],
											'header'=>'Actions',
											'template'=>'{update}  {delete}  {create}',
											'buttons' => [
												//create button
												'create' => function ($url, $model) {
													return Html::a('<span class="fa fa-plus"></span>Create', $url, [
																'title' => Yii::t('app', 'Create'),
																'class'=>'btn btn-primary btn-xs',                                  
													]);
												},
											],
											'urlCreator' => function ($action, $model, $key, $index) use ($profilemodel) {
												if ($action === 'update') {
													$url ='index.php?r=profileexperience/update&id=' . $model->id;
													return($url);
												}
												if ($action === 'delete') {
													$url ='index.php?r=profileexperience/delete&id=' . $model->id;
													return($url);
												}
												if ($action === 'create') {
													$url ='index.php?r=profileexperience/create&profile_id=' . $profilemodel->id;
													return($url);
												}
											}
										],
								],
							]); ?>
				<?php
							//$excounter++;
						//}
					}
				?>
                
                <div class="my_admin_view admin_window_full  container">
                    <center>
						<?php
							$id = Yii::$app->user->id;
							//echo Html::a('EDIT PROFILE', ["/userprofile/update"], ['class'=>'btn btn-primary']); 
							echo Html::a('EDIT PROFILE', ['update', 'id' => $id], ['class' => 'btn btn-primary']);
						?>
                    </center>    
                </div>
                
<?php
                //$this->endCache();
            }
	}
	else
	{
		$this->redirect("/");
	}
?>

