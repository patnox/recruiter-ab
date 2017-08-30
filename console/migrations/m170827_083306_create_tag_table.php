<?php

use yii\db\Migration;

/**
 * Handles the creation of table `tag`.
 */
class m170827_083306_create_tag_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('tag', [
            'id' => $this->primaryKey(),
			'name' => $this->string(64)->notNull()->unique(), // 'name' is unique 'varchar' type with length of 64 chars, cannot be null
            'created_at' => $this->datetime()->notNull(), // 'created_at' is 'datetime' type, cannot be null
            'updated_at' => $this->datetime(), // 'updated_at' is 'datetime' type, can be null, default will be null
        ]);
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('tag');
    }
}
