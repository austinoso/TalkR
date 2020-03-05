class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in"
      session[:user_id] = @user.id
      redirect_to chats_path
    elsif !@user
      flash[:no_user] = "User does not exist, please sign up!"
      redirect_to register_path
    else
      flash[:error] = "Wrong password!! Please try again"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end