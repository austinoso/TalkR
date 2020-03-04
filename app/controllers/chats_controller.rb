class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :destroy, :edit, :update, :add_user, :remove_user]
    before_action :chat_user_authorize, only: [:show]
    before_action :chat_owner_authorize, only: [:edit, :update, :destroy]

    def index
        @chats = Chat.all.select { |chat| chat.users.include? current_user }
    end

    def show
        @message = @chat.messages.build(user_id: session[:user_id])
        @messages = @chat.messages[0...-1]
    end

    def edit
        @current_users = @chat.users
        @users = User.all - @current_users
    end

    def update
        @chat.update(chat_params)
    end

    def new
        @chat = Chat.new(owner_id: session[:user_id])
        @chat.chat_users.build
    end

    def create
        @chat = Chat.create(chat_params)
        @chat.users << current_user
        redirect_to @chat
    end

    def destroy
        @chat.destroy
        redirect_to chats_path
    end

    def add_user
        @chat.users << (User.find(params[:user_id]))
        @chat.save
        redirect_to edit_chat_path
    end

    def remove_user
        @chat.users.delete(User.find(params[:user_id]))
        @chat.save
        redirect_to edit_chat_path
    end

    private

    def chat_params
        params.require(:chat).permit(
            :owner_id,
            :name,
            chat_users_attributes: [
                :user_id,
                :chat_id
            ]
        )
    end

    def set_chat
        @chat = Chat.find(params[:id])
    end

    def chat_user_authorize
        redirect_to chats_path if !@chat.users.include? current_user
    end

    def chat_owner_authorize
        redirect_to chats_path if @chat.owner_id != session[:user_id]
        flash[:warning] = "You dont have admin rights!" if @chat.owner_id != session[:user_id]
    end

end
