<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "profile_education".
 *
 * @property integer $id
 * @property integer $profile_id
 * @property string $institution
 * @property string $course
 * @property string $date_from
 * @property string $date_to
 *
 * @property Profile $profile
 */
class ProfileEducation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile_education';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['profile_id', 'institution', 'course', 'date_from', 'date_to'], 'required'],
            [['profile_id'], 'integer'],
            [['date_from', 'date_to'], 'safe'],
            [['institution', 'course'], 'string', 'max' => 128],
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
            'institution' => 'Institution',
            'course' => 'Course',
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
