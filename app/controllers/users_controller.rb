class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["first_name"] = params["user"]["first_name"]
    @user["last_name"] = params["user"]["last_name"]
    @user["email"] = params["user"]["email"]
    @user["password"] = params["user"]["password"]
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/places", notice: 'User created successfully'
    else
      render :new
    end
  end
end
