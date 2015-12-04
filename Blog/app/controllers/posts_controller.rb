class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    post.save
    redirect_to(root_path)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id:params[:id]).order("created_at")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params())
    redirect_to(root_path)
  end

  def destroy
   post = Post.find(params[:id])
   post.destroy 
   redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:name,:content)
  end

end
