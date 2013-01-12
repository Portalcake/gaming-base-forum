require_dependency "forum/application_controller"

module Forum
  class PostsController < ApplicationController
    before_filter :authenticate_user!

    def new
      authorize!(:create, Post)
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.new
      respond_with
    end

    def edit
      @post = Post.find(params[:id])
      authorize!(:edit, @post)
      respond_with(@post)
    end

    def create
      authorize!(:create, Post)
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.new(params[:post])
      @post.user = current_user

      respond_to do |format|
        if @post.save
          @post.topic.update_last_post_information!
          format.html { redirect_to @post.topic, notice: 'Post was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @post = Post.find(params[:id])
      authorize!(:update, @post)

      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post.topic, notice: 'Post was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @post = Post.find(params[:id])
      authorize!(:destroy, @post)
      @post.destroy
      
      @post.topic.update_last_post_information!

      respond_to do |format|
        format.html { redirect_to @post.topic, notice: 'Post was successfully deleted.' }
      end
    end
  end
end
