class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = @current_user.posts
  end
  
  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = @current_user.posts.new(post_params.except(:image))
    if @post.save
      @post.image.attach(post_params[:image]) if post_params[:image]
      redirect_to "/places/#{@post.place_id}"
    else
      render :new
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :description, :posted_on, :image, :place_id)
  end

  def require_login
    unless @current_user
      redirect_to new_session_path
    end
  end
end