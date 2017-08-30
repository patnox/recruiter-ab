<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "job_invitation".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $job_id
 * @property string $invitation_date
 * @property string $target_date
 * @property string $target_venue
 * @property integer $type
 * @property integer $accepted
 *
 * @property Job $job
 * @property User $user
 */
class JobInvitation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'job_invitation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'job_id', 'invitation_date', 'target_date', 'target_venue', 'description'], 'required'],
            [['user_id', 'job_id', 'type', 'accepted'], 'integer'],
            [['invitation_date', 'target_date'], 'safe'],
            [['target_venue'], 'string', 'max' => 128],
            [['job_id'], 'exist', 'skipOnError' => true, 'targetClass' => Job::className(), 'targetAttribute' => ['job_id' => 'id']],
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
			$this->target_date = date('Ymd', strtotime($this->target_date));
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
            'user_id' => 'Applicant',
            'job_id' => 'Job Title',
            'invitation_date' => 'Invitation Date',
            'target_date' => 'Interview Date',
            'target_venue' => 'Interview Venue',
            'type' => 'Type',
            'accepted' => 'Accepted',
			'description' => 'Invitation Letter',
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
