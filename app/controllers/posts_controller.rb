class PostsController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :is_admin?, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end
  
  def show 
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      flash[:notice] = "Post created successfully"
      redirect_to post 
    else 
      flash[:alert] = "Post not created: #{post.errors.full_messages.first}"
      redirect_back fallback_location: root_path
    end
  end 

  def edit 
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated successfully"
      redirect_to @post
    else 
      render :edit 
    end
  end

  private 

  def post_params
    params.require(:post).permit(:title, :description, :image)  
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def is_admin?
    unless current_user.admin?
      flash[:alert] = "only administrators can create posts"
      redirect_back fallback_location: root_path
    end
  end
end
