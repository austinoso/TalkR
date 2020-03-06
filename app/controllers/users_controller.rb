class UsersController < ApplicationController
    skip_before_action :authorize, only: [:index, :show, :new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy, :add_contact]
    before_action :current_user, only: [:show, :add_contact]
    before_action :user_authorize, only: [:edit, :update, :destroy]


    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            flash[:success] = "User successfully created!"
            redirect_to @user
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        @user.update(user_params)
        if @user.valid?
            flash[:success] = "User successfully edited!"
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to register_path
    end

    def add_contact
        current_user.contacts << @user
        current_user.contacts.uniq!{|c| c.user_id}
        redirect_to @current_user
    end

    private

    def user_params
        params.require(:user).permit(:password, :password_confirmation, :name, :email, :bio, :country, :language_id)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

    def user_authorize
        redirect_to users_path if @user.id != session[:user_id]
        flash[:no_access] = "You don't have access!" if @user.id != session[:user_id]
    end
end