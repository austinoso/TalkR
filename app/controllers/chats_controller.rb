class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :destroy]

    def index
        @chats = Chat.all.select { |chat| chat.users.include? User.first }
    end

    def show
        @message = @chat.messages.build(user_id: User.first.id)
        @messages = @chat.messages[0...-1]
    end

    def new
        @chat = Chat.new(owner_id: User.first.id)
        @chat.chat_users.build
    end

    def create
        byebug
        @chat = Chat.create(chat_params)
        @chat.users  << User.first
        redirect_to @chat
    end

    def destroy
        @chat.destroy
        redirect_to chats_path
    end

    private

    def chat_params
        params.require(:chat).permit(
            :owner_id,
            chat_users_attributes: [
                :user_id,
                :chat_id
            ]
        )
    end

    def set_chat
        @chat = Chat.find(params[:id])
    end
end
