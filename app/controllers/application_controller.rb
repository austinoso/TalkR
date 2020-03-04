class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :authorize
  
    def current_user
      @user = User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorize
      redirect_to login_path if !current_user?
    end
end
