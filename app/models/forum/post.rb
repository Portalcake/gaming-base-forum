module Forum
  class Post < ActiveRecord::Base

    self.per_page = 15

    belongs_to :user, :inverse_of => :posts
    belongs_to :topic,
          :inverse_of => :posts,
          :counter_cache => true

    attr_accessible :content

    validates :user_id, :content, :presence => true

  end
end
