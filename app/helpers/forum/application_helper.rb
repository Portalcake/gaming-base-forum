module Forum
  module ApplicationHelper

    def forum_build_page_navigation
      Proc.new {|primary|
        primary.item :news, "News", main_app.news_index_path
        primary.item :forum, "Forum", topics_path, :highlights_on=>/[a-z]{2}\/forum/ do |forum|
          forum.item :index, "All topics", topics_path
          forum.item :create, "New topic", new_topic_path
        end

        primary.item :placeholder_games, "", :class => :placeholder
        primary.item :ragnarok2, "Ragnarok2", ragnarok2.root_path
      }
    end
  end
end
