<?php

namespace frontend\controllers;

use Yii;
use common\models\ProfileLanguage;
use common\models\ProfilelanguageSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;

/**
 * ProfilelanguageController implements the CRUD actions for ProfileLanguage model.
 */
class ProfilelanguageController extends Controller
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
     * Lists all ProfileLanguage models.
     * @return mixed
     */
    public function actionIndex($profile_id)
    {
		/**
        $searchModel = new ProfilelanguageSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
		**/
		if(!Yii::$app->user->isGuest) 
		{
			$model = \common\models\Profilelanguage::find()->where(['profile_id' => $profile_id]);
			if($model)
			{
				//We found a record
				$languageProvider = new ActiveDataProvider([
						'query' => $model,
						'pagination' => [
							'pageSize' => 20,
							'pageParam' => 'language-page',
						],
				]);
				
				return $this->render('index', [
					'languages' => $languageProvider,
					'profile_id' => $profile_id,
					'model' => $model,
				]);
			}
			else
			{
				//We didnt find a record we create one
				return $this->redirect(['create', 'profile_id' => $profile_id]);
			}
		}
		else
		{
			return $this->redirect(['site/login']);
		}	
    }

    /**
     * Displays a single ProfileLanguage model.
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
			return $this->redirect(['site/login']);
		}
    }

    /**
     * Creates a new ProfileLanguage model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($profile_id)
    {
		if(!Yii::$app->user->isGuest) 
		{
			$model = new ProfileLanguage();

			if ($model->load(Yii::$app->request->post()) && $model->save()) 
			{
				//return $this->redirect(['view', 'id' => $model->id]);
				return $this->redirect(['userprofile/index']);
			} 
			else 
			{
				return $this->render('create', [
					'profile_id' => $profile_id,
					'model' => $model,
				]);
			}
		}
		else
		{
			return $this->redirect(['site/login']);
		}
    }

    /**
     * Updates an existing ProfileLanguage model.
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
				return $this->redirect(['userprofile/index']);
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
			return $this->redirect(['site/login']);
		}
    }

    /**
     * Deletes an existing ProfileLanguage model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
		if(!Yii::$app->user->isGuest) 
		{
			$this->findModel($id)->delete();

			//return $this->redirect(['index']);
			return $this->redirect(['userprofile/index']);
		}
		else
		{
			return $this->redirect(['site/login']);
		}
    }

    /**
     * Finds the ProfileLanguage model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProfileLanguage the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ProfileLanguage::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
