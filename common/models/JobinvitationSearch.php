<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\JobInvitation;

/**
 * JobinvitationSearch represents the model behind the search form about `common\models\JobInvitation`.
 */
class JobinvitationSearch extends JobInvitation
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'job_id', 'type', 'accepted'], 'integer'],
            [['invitation_date', 'target_date', 'target_venue'], 'safe'],
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
        $query = JobInvitation::find();

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
            'invitation_date' => $this->invitation_date,
            'target_date' => $this->target_date,
            'type' => $this->type,
            'accepted' => $this->accepted,
        ]);

        $query->andFilterWhere(['like', 'target_venue', $this->target_venue]);

        return $dataProvider;
    }
}
