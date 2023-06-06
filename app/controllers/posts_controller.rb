class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = current_user.posts
  end
  
  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = @current_user.id
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end  

  def post_params
    params.require(:post).permit(:title, :description, :posted_on, :image)
  end
  
  private
    def require_login
      unless current_user
        redirect_to new_session_path
      end
    end
end