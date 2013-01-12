module Forum
  class Topic < ActiveRecord::Base
    attr_accessible :title, :posts_attributes

    belongs_to :user, :inverse_of => :topics
    belongs_to :last_user,
        :class_name => "User"

    has_many :posts,
        :dependent => :destroy,
        :order => "created_at ASC"

    validates :title, :presence => true

    scope :default_order, order("last_post_at DESC")

    accepts_nested_attributes_for :posts, :reject_if => :all_blank

    def update_last_post_information!
      self.last_post_at = self.posts.last.created_at
      self.last_user = self.posts.last.user
      self.save
    end

    def to_s
      "#{self.title}"
    end

    def to_param
      "#{self.id}-#{self.title.parameterize}"
    end
  end
end
