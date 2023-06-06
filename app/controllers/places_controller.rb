class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = current_user.places
  end  

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user.id })
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end

  private
  def require_login
    unless current_user
      redirect_to login_path
    end  
  end
end
