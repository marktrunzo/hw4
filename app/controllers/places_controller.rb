class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = @current_user.places
  end  

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user.id })
  end

  def new
    @place = Place.new
  end

  def create
    @place = @current_user.places.new(place_params)
    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end
  
  private
  
  def place_params
    params.require(:place).permit(:name)
  end
  
  def require_login
    unless @current_user
      redirect_to login_path
    end  
  end
end
