<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "profile_language".
 *
 * @property integer $id
 * @property integer $profile_id
 * @property string $language_name
 *
 * @property Profile $profile
 */
class ProfileLanguage extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile_language';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['profile_id', 'language_name'], 'required'],
            [['profile_id'], 'integer'],
            [['language_name'], 'string', 'max' => 128],
            [['profile_id'], 'exist', 'skipOnError' => true, 'targetClass' => Profile::className(), 'targetAttribute' => ['profile_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'profile_id' => 'Profile ID',
            'language_name' => 'Language Name',
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
