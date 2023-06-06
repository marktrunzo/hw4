class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to places_path, notice: 'User was successfully created. Please sign in.'
    else
      render :new
    end
    
  end
    
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
