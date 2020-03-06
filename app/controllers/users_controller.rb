class UsersController < ApplicationController
    skip_before_action :authorize, only: [:index, :new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :user_authorize, only: [:edit, :update, :destroy, :contacts]
    before_action :no_register, only: [:new]

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
        session.delete(:user_id)
        @user.destroy
        redirect_to register_path
    end

    def add_contact

        current_user.contacts << User.find(params[:id]) if !current_user.contacts.include? User.find(params[:id])
        redirect_to contacts_path
    end

    def contacts
    end

    private

    def user_params
        params.require(:user).permit(:password, :password_confirmation, :name, :email, :bio, :country, :language_id)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_authorize
        set_user
        redirect_to users_path if @user.id != session[:user_id]
        flash[:no_access] = "You don't have access!" if @user.id != session[:user_id]
    end

    def no_register
        current_user
        redirect_to @user if logged_in?
    end
end