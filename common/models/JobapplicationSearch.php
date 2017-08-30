<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\JobApplication;

/**
 * JobapplicationSearch represents the model behind the search form about `common\models\JobApplication`.
 */
class JobapplicationSearch extends JobApplication
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'job_id', 'invited', 'type'], 'integer'],
            [['application_date', 'cover_letter'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = JobApplication::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'job_id' => $this->job_id,
            'application_date' => $this->application_date,
            'invited' => $this->invited,
            'type' => $this->type,
        ]);

        $query->andFilterWhere(['like', 'cover_letter', $this->cover_letter]);

        return $dataProvider;
    }
}
