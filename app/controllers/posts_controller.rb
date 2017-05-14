class PostsController < ApplicationController 
  def index
    @posts = Post.all
  end
  
  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if current_user.admin?
      post.user = current_user
      if post.save
        flash[:notice] = "Post created successfully"
        redirect_back fallback_location: root_path
      else 
        flash[:alert] = "Post not created: #{post.errors.full_messages.first}"
        redirect_back fallback_location: root_path
      end
    else 
      flash[:alert] = "Post not created: #{post.errors.full_messages.first}"
      redirect_back fallback_location: root_path
    end
  end 

  private 

  def post_params
    params.require(:post).permit(:title, :description, :image, :user_id)  
  end
end
