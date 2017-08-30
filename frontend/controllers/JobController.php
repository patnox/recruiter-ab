<?php

namespace frontend\controllers;

use Yii;
use common\models\Job;
use common\models\JobSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\data\ActiveDataProvider;

/**
 * JobController implements the CRUD actions for Job model.
 */
class JobController extends Controller
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
     * Lists all Job models.
     * @return mixed
     */
    public function actionIndex()
    {
		if(!Yii::$app->user->isGuest) 
		{
			$searchModel = new JobSearch();
			$dataProvider = $searchModel->search(Yii::$app->request->queryParams);
			/**
			$dataProvider = new ActiveDataProvider([
				'query' => Job::find(),
				'pagination' => [ 'pageSize' => 5 ],
			]);
			**/
			$dataProvider->pagination->pageSize = 5;

			return $this->render('index', [
				'searchModel' => $searchModel,
				'dataProvider' => $dataProvider,
			]);
		}
		else
		{
			return $this->redirect("/index.php?r=site/login");
		}
    }
	
	/**
     * Lists all Job models.
     * @return mixed
     */
    public function actionSearch()
    {
		return $this->actionIndex();
		//return $this->redirect(['index']);
	}

    /**
     * Displays a single Job model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
		if(!Yii::$app->user->isGuest) 
		{
			$model = $this->findModel($id);
			$category = \common\models\Category::find()->where(['id' => $model->category_id])->one();
			return $this->render('view', [
				'category' => $category,
				'model' => $model,
			]);
		}
		else
		{
			return $this->redirect("/index.php?r=site/login");
		}
    }

    /**
     * Creates a new Job model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
		if(!Yii::$app->user->isGuest) 
		{
			$model = new Job();

			if ($model->load(Yii::$app->request->post()) && $model->save()) {
				return $this->redirect(['view', 'id' => $model->id]);
			} else {
				return $this->render('create', [
					'model' => $model,
				]);
			}
		}
		else
		{
			return $this->redirect("/index.php?r=site/login");
		}
    }

    /**
     * Updates an existing Job model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
		if(!Yii::$app->user->isGuest) 
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
		else
		{
			return $this->redirect("/index.php?r=site/login");
		}
    }

    /**
     * Deletes an existing Job model.
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
			return $this->redirect("/index.php?r=site/login");
		}
    }

    /**
     * Finds the Job model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Job the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Job::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
