class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Woohoo, your article was succefully saved!"
    else
      render 'new', notice: "Oh no, i was unable to save your post"
    end
  end

  def show
    #we need to find the post first
    #but we do it in the before_action section above
  end

  def edit
    #we need to find the post first
    #but we do it in the before_action section above
  end

  def update
    #we need to find the post first
    #but we do it in the before_action section above
    if @post.update post_params
      redirect_to @post, notice: "Huzzah! Your article was succefully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    #we need to find the post first
    #but we do it in the before_action section above
    @post.destroy
    redirect_to posts_path #links to the posts#index
  end


  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end


end
