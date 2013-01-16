class ForumAddViewsToTopics < ActiveRecord::Migration
  def change
    add_column :forum_topics, :views_count, :integer, :default=>0, :null=>false
  end
end
