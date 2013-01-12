class CreateForumTopics < ActiveRecord::Migration
  def change
    create_table :forum_topics do |t|
      t.string :title
      t.references :user
      t.integer :last_user_id
      t.datetime :last_post_at
      t.boolean :closed
      t.integer :posts_count, :default=>0, :null=>false

      t.timestamps
    end
    add_index :forum_topics, :user_id
    add_index :forum_topics, :last_post_at
    add_index :forum_topics, :posts_count
  end
end
