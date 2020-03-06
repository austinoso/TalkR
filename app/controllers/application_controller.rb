class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :authorize, :no_register
  
    def current_user
      @user = User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorize
      redirect_to login_path if !logged_in?
    end
    
    def no_register
      current_user
      redirect_to @user if logged_in?
    end
end
