class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post, notice: 'Updated!'
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post, notice: "New post created."
  end

  def destroy
    @post.destroy
    redirect_to profile_path, notice: "Post destroyed"
  end

  private

  def set_post
    begin
      @post = Post.find(params[:id])
    rescue
      flash[:notice] = "Post can't be found"
      redirect_to @user
    end
  end

  def post_params
    params.require(:post).permit(:body, :title).merge(user: current_user)
  end
end
