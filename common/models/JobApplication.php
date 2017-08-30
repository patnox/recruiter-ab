<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "job_application".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $job_id
 * @property string $application_date
 * @property integer $invited
 * @property string $cover_letter
 * @property integer $type
 *
 * @property Job $job
 * @property User $user
 */
class JobApplication extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'job_application';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'job_id', 'application_date', 'cover_letter'], 'required'],
            [['user_id', 'job_id', 'invited', 'type'], 'integer'],
            [['application_date'], 'safe'],
            [['cover_letter'], 'string'],
            [['job_id'], 'exist', 'skipOnError' => true, 'targetClass' => Job::className(), 'targetAttribute' => ['job_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'Applicant',
            'job_id' => 'Job Title',
            'application_date' => 'Application Date',
            'invited' => 'Invited',
            'cover_letter' => 'Cover Letter',
            'type' => 'Type',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJob()
    {
        return $this->hasOne(Job::className(), ['id' => 'job_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
