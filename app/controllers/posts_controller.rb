class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[new show edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(user: current_user.timeline_ids ).recent
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to posts_path(@user)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_url
  end

  private
  
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
