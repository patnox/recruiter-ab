<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "job".
 *
 * @property integer $id
 * @property string $title
 * @property string $slug
 * @property string $content
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $category_id
 *
 * @property Category $category
 * @property User $createdBy
 * @property User $updatedBy
 * @property JobTag[] $jobTags
 */
class Job extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'job';
    }
	
	//override behaviors
	public function behaviors()
	{
		return [
			'timestamp' => [
				'class' => TimestampBehavior::className(),
				'attributes' => [
					ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
					ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
				],
				'value' => new Expression('NOW()'),
			],
			[
				'class' => BlameableBehavior::className(),
				'createdByAttribute' => 'created_by',
				'updatedByAttribute' => 'updated_by',
			],
			[
				'class' => SluggableBehavior::className(),
				'attribute' => 'title',
				'slugAttribute' => 'slug',
			],
		];
	}

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'category_id', 'company', 'salary', 'location'], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
			[['expires_at'], 'default', 'value' => null],
            [['created_by', 'updated_by', 'category_id'], 'integer'],
            [['title', 'slug', 'company', 'salary', 'location'], 'string', 'max' => 128],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category_id' => 'id']],
            [['created_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['created_by' => 'id']],
            [['updated_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['updated_by' => 'id']],
        ];
    }

	/**
     * @inheritdoc
     */
	public function beforeSave($insert)
	{
		if(parent::beforeSave($insert))
		{
			$this->expires_at = date('Ymd', strtotime($this->expires_at));
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
            'title' => 'Title',
            'slug' => 'Summary',
			'company' => 'Company',
			'salary' => 'Salary',
			'location' => 'Location',
            'content' => 'Details',
            'created_at' => 'Created At',
			'expires_at' => 'Expires At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'category_id' => 'Category',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJobTags()
    {
        return $this->hasMany(JobTag::className(), ['job_id' => 'id']);
    }
	
	/**
     * @return \yii\db\ActiveQuery
     */
    public function getJobApplications()
    {
        return $this->hasMany(JobApplication::className(), ['job_id' => 'id']);
    }
	
	/**
     * @return \yii\db\ActiveQuery
     */
    public function getJobInvitations()
    {
        return $this->hasMany(JobInvitation::className(), ['job_id' => 'id']);
    }
}
