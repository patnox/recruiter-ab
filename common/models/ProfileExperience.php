<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "profile_experience".
 *
 * @property integer $id
 * @property integer $profile_id
 * @property string $company
 * @property string $profession
 * @property string $date_from
 * @property string $date_to
 *
 * @property Profile $profile
 */
class ProfileExperience extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile_experience';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['profile_id', 'company', 'profession', 'date_from', 'date_to'], 'required'],
            [['profile_id'], 'integer'],
            [['date_from', 'date_to'], 'safe'],
            [['company', 'profession'], 'string', 'max' => 128],
            [['profile_id'], 'exist', 'skipOnError' => true, 'targetClass' => Profile::className(), 'targetAttribute' => ['profile_id' => 'id']],
        ];
    }
	
	/**
     * @inheritdoc
     */
	public function beforeSave($insert)
	{
		if(parent::beforeSave($insert))
		{
			$this->date_from = date('Ymd', strtotime($this->date_from));
			$this->date_to = date('Ymd', strtotime($this->date_to));
			return(TRUE);
		}
		else
		{
			return(false);
		}
	}

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'profile_id' => 'Profile ID',
            'company' => 'Company',
            'profession' => 'Profession',
            'date_from' => 'Date From',
            'date_to' => 'Date To',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfile()
    {
        return $this->hasOne(Profile::className(), ['id' => 'profile_id']);
    }
}
