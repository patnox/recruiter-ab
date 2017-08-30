<?php

namespace frontend\controllers;

use Yii;
use common\models\Userprofile;
use common\models\UserprofileSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\data\ActiveDataProvider;

/**
 * UserprofileController implements the CRUD actions for Userprofile model.
 */
class UserprofileController extends Controller
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
     * Lists all Userprofile models.
     * @return mixed
     */
    public function actionIndex()
    {
		/**
        $searchModel = new UserprofileSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
		**/
		if(!Yii::$app->user->isGuest) 
		{
			$model = $this->findModel(Yii::$app->user->id);
			if($model)
			{
				//We found a record
				$country = \common\models\Countries::find()->where(['id' => $model->country_id])->one();
				//$education = \common\models\Profileeducation::find()->where(['profile_id' => $model->id])->all();
				$educationProvider = new ActiveDataProvider([
						'query' => \common\models\Profileeducation::find()->where(['profile_id' => $model->id]),
						'pagination' => [
							'pageSize' => 20,
							'pageParam' => 'education-page',
						],
				]);
				//$experience = \common\models\Profileexperience::find()->where(['profile_id' => $model->id])->all();
				$experienceProvider = new ActiveDataProvider([
						'query' => \common\models\Profileexperience::find()->where(['profile_id' => $model->id]),
						'pagination' => [
							'pageSize' => 20,
							'pageParam' => 'experience-page',
						],
				]);
				$languages = \common\models\Profilelanguage::find()->where(['profile_id' => $model->id])->all();
				return $this->render('index', [
					'country' => $country,
					'education' => $educationProvider,
					'experience' => $experienceProvider,
					'languages' => $languages,
					'model' => $model,
				]);
			}
			else
			{
				//We didnt find a record we create one
				return $this->redirect(['create']);
			}
		}
		else
		{
			return $this->redirect("/");
		}	
    }

    /**
     * Displays a single Userprofile model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
		if(!Yii::$app->user->isGuest) 
		{
			return $this->render('view', [
				'model' => $this->findModel($id),
			]);
		}
		else
		{
			return $this->redirect("/");
		}
    }

    /**
     * Creates a new Userprofile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
		if(!Yii::$app->user->isGuest) 
		{
			$model = new Userprofile();

			if ($model->load(Yii::$app->request->post()) && $model->save()) 
			{
				//return $this->redirect(['view', 'id' => $model->id]);
				return $this->redirect(['index']);
			} 
			else 
			{
				return $this->render('create', [
					'model' => $model,
				]);
			}
		}
		else
		{
			return $this->redirect("/");
		}
    }

    /**
     * Updates an existing Userprofile model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
		if(!Yii::$app->user->isGuest) 
		{
			$model = $this->findModel($id);

			if ($model->load(Yii::$app->request->post()) && $model->save()) 
			{
				//return $this->redirect(['view', 'id' => $model->id]);
				return $this->redirect(['index']);
			} 
			else 
			{
				return $this->render('update', [
					'model' => $model,
				]);
			}
		}
		else
		{
			return $this->redirect("/");
		}
    }

    /**
     * Deletes an existing Userprofile model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
		if(!Yii::$app->user->isGuest) 
		{
			$this->findModel($id)->delete();

			return $this->redirect(['index']);
		}
		else
		{
			return $this->redirect("/");
		}
    }

    /**
     * Finds the Userprofile model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Userprofile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //if (($model = Userprofile::findOne($id)) !== null) {
		if (($model = Userprofile::find()->where(['user_id' => $id])->one()) !== null) {
            return $model;
        } 
		else 
		{
            //throw new NotFoundHttpException('The requested page does not exist.');
			//$this->actionUpdate(Yii::$app->user->id);
			//$this->actionCreate();
			//$this->redirect(['create']);
			return(false);
        }
    }
}
