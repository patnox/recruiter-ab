<?php

namespace frontend\controllers;

use Yii;
use common\models\JobInvitation;
use common\models\JobinvitationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\data\ActiveDataProvider;
use yii\data\ArrayDataProvider;

/**
 * JobinvitationController implements the CRUD actions for JobInvitation model.
 */
class JobinvitationController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all JobInvitation models.
     * @return mixed
     */
    public function actionIndex()
    {
        //$searchModel = new JobinvitationSearch();
        //$dataProvider = $searchModel->search(Yii::$app->request->queryParams);
		$model = JobInvitation::find()->where(['user_id' => Yii::$app->user->id]);
		$dataProvider = new ActiveDataProvider([
			'query' => $model,
			'pagination' => [
				'pageSize' => 5,
				'pageParam' => 'jobinvitation-page',
			],
		]);

        return $this->render('index', [
            //'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
	
	/**
     * Lists all JobApplication models.
     * @return mixed
     */
    public function actionTalent()
    {
        //$searchModel = new JobapplicationSearch();
        //$dataProvider = $searchModel->search(Yii::$app->request->queryParams);
		//A Many to Many Relationship (Jobs and Job Invitations)
		////SQL: select job_invitation.* from job_invitation inner join job on job_invitation.job_id = job.id and job.created_by = 3;
		//$jobmodel = \common\models\Job::find()->where(['created_by' => Yii::$app->user->id])->one();
		//$jobmodel = \common\models\Job::find()->where(['created_by' => Yii::$app->user->id])->all();
		//$model = $jobmodel->getJobInvitations();
		//$model = $jobmodel->jobInvitations;
		/**
		$models;
		foreach($jobmodel as $model) // iterate over all associated posts of category
		{
			$models[] = $model->getJobInvitations();
		}
		**/
		$query = "select job_invitation.* from job_invitation inner join job on job_invitation.job_id = job.id and job.created_by = " . Yii::$app->user->id;
		///**
		$dataProvider = new ActiveDataProvider([
			//'query' => $model,
			'query' => JobInvitation::findBySql($query),
			'pagination' => [
				'pageSize' => 5,
				'pageParam' => 'jobapplication-page',
			],
		]);
		//**/
		/**
		$dataProvider = new ArrayDataProvider([
			'allModels' => $models,
		]);
		**/

        return $this->render('talent', [
            //'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
	
	/**
     * Displays a single JobInvitation model.
     * @param integer $id
     * @return mixed
     */
    public function actionInvite($profile_id)
    {
		$profile = \common\models\Profile::find()->where(['id' => $profile_id])->one();
		$user_id = $profile->user_id;
		
        $model = new JobInvitation();

        if ($model->load(Yii::$app->request->post())) 
		{
			//We create a disabled job to attach this invite to
			$jobmodel = new \common\models\Job();
			$jobmodel->title = "Interview Invitation";
			$jobmodel->slug = "Interview Invitation";
			$jobmodel->content = "Interview Invitation";
			$jobmodel->category_id = "1";
			$jobmodel->company = "interview";
			$jobmodel->salary = "0";
			$jobmodel->location = "interview";
			$jobmodel->expires_at = date('Y-m-d');
			$jobmodel->disabled = "1";
			
			if($jobmodel->save())
			{
				$job_id = $jobmodel->id;
				$model->job_id = $job_id;
				
				if($model->save())
				{
					//return $this->redirect(['view', 'id' => $model->id]);
					return $this->render('successfulinvitation');
				}
				else
				{
					return $this->render('failedinvitation');
				}
			}
			else
			{
				return $this->render('failedinvitation');
			}
        } 
		else 
		{
            return $this->render('create', [
				'user_id' => $user_id,
				'job_id' => 1,
                'model' => $model,
            ]);
        }
    }
	
		/**
     * Displays a single JobInvitation model.
     * @param integer $id
     * @return mixed
     */
    public function actionAccept($job_id, $user_id, $jobapplication_id)
    {
        $model = new JobInvitation();

        if ($model->load(Yii::$app->request->post())) 
		{
			if($model->save())
			{
				//Update the job application as invited
				$applicationmodel = \common\models\JobApplication::findOne($jobapplication_id);
				$applicationmodel->invited = 1;
				$applicationmodel->save();
				//return $this->redirect(['view', 'id' => $model->id]);
				return $this->render('successfulinvitation');
			}
			else
			{
				return $this->render('failedinvitation');
			}
        } 
		else 
		{
            return $this->render('create', [
				'user_id' => $user_id,
				'job_id' => $job_id,
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays a single JobInvitation model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new JobInvitation model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new JobInvitation();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing JobInvitation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }
	
	/**
     * Updates an existing JobInvitation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionSelfaccept($id)
    {
        $model = $this->findModel($id);
		$model->accepted = 1;
		
        if ($model->save()) 
		{
            return $this->redirect(['index']);
        }
    }
	
	/**
     * Updates an existing JobInvitation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionSelfdecline($id)
    {
        $model = $this->findModel($id);
		$model->accepted = 0;
		
        if ($model->save()) 
		{
            return $this->redirect(['index']);
        }
    }

    /**
     * Deletes an existing JobInvitation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the JobInvitation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return JobInvitation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = JobInvitation::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
