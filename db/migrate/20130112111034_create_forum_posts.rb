class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.references :user
      t.references :topic
      t.text :content

      t.timestamps
    end
    add_index :forum_posts, :user_id
    add_index :forum_posts, :topic_id
  end
end
