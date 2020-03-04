class UsersController < ApplicationController
    skip_before_action :authorize, only: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

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
            flash[:notice] = "User successfully created"
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
            flash[:notice] = "User successfully edited"
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to new_user_path
    end

    private

    def user_params
        params.require(:user).permit!
    end

    def set_user
        @user = User.find(params[:id])
    end
end
