class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def show
    redirect_to login_path
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfully logged in"
      redirect_to places_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  


  def destroy
    session.delete(:user_id)
    redirect_to login_url
  end
  
end
