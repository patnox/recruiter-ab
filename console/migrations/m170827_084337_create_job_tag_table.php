<?php

use yii\db\Migration;

/**
 * Handles the creation of table `job_tag`.
 */
class m170827_084337_create_job_tag_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('job_tag', [
            'id' => $this->primaryKey(),
			'job_id' => $this->integer()->notNull(),
            'tag_id' => $this->integer()->notNull()
        ]);
		
		$this->createIndex('job_tag_index', 'job_tag', ['job_id', 'tag_id']);
        $this->addForeignKey('fk_job_tag_job', 'job_tag', 'job_id', 'job', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk_job_tag_tag', 'job_tag', 'tag_id', 'tag', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
		$this->dropForeignKey('fk_job_tag_job', 'job_tag');
        $this->dropForeignKey('fk_job_tag_tag', 'job_tag');
        $this->dropTable('job_tag');
    }
}
