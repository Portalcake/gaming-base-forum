require_dependency "forum/application_controller"

module Forum
  class TopicsController < ApplicationController

    before_filter :authenticate_user!, :except => [:show, :index]

    def index
      respond_with(@topics = Topic.default_order.page(params[:page]))
    end

    def show
      @topic = Topic.find(params[:id])
      @posts = @topic.posts.page(params[:page])
      @topic.count_view!
      respond_with
    end

    def new
      authorize!(:create, Topic)
      @topic = Topic.new
      @post = @topic.posts.build
      respond_with
    end

    def edit
      @topic = Topic.find(params[:id])
      authorize!(:edit, @topic)
      respond_with(@topic)
    end

    def create
      authorize!(:create, Topic)
      @topic = Topic.new(:title=>params[:topic][:title])
      @topic.user = current_user

      @post = @topic.posts.build(:content=>params[:topic][:post][:content])
      @post.user = current_user


      respond_to do |format|
        if @topic.save
          format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @topic = Topic.find(params[:id])
      authorize!(:update, @topic)

      respond_to do |format|
        if @topic.update_attributes(params[:topic])
          format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @topic = Topic.find(params[:id])
      authorize!(:destroy, @topic)
      @topic.destroy

      respond_to do |format|
        format.html { redirect_to topics_url }
      end
    end
  end
end
