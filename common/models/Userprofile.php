<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "profile".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $country_id
 * @property string $dob
 * @property integer $expected_salary
 * @property string $description
 *
 * @property Countries $country
 * @property User $user
 * @property ProfileEducation[] $profileEducations
 * @property ProfileExperience[] $profileExperiences
 * @property ProfileLanguage[] $profileLanguages
 */
class Userprofile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'country_id', 'dob', 'expected_salary', 'first_name', 'last_name', 'address', 'description'], 'required'],
            [['user_id', 'country_id', 'expected_salary'], 'integer'],
            //[['dob'], 'safe'],
			[['dob'], 'default', 'value' => null],
            [['description'], 'string'],
            [['country_id'], 'exist', 'skipOnError' => true, 'targetClass' => Countries::className(), 'targetAttribute' => ['country_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }
	
	/**
     * @inheritdoc
     */
	public function beforeSave($insert)
	{
		if(parent::beforeSave($insert))
		{
			$this->dob = date('Ymd', strtotime($this->dob));
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
            'user_id' => 'User ID',
            'country_id' => 'Country',
            'dob' => 'Date Of Birth',
            'expected_salary' => 'Expected Salary',
            'description' => 'Description',
			'first_name' => 'First Name', 
			'last_name' => 'Last Name', 
			'address' => 'Address',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(Countries::className(), ['id' => 'country_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfileEducations()
    {
        return $this->hasMany(ProfileEducation::className(), ['profile_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfileExperiences()
    {
        return $this->hasMany(ProfileExperience::className(), ['profile_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfileLanguages()
    {
        return $this->hasMany(ProfileLanguage::className(), ['profile_id' => 'id']);
    }
}
