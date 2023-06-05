class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def show
    redirect_to new_session_path
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/places", notice: 'Logged in'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out'
  end
  
end
