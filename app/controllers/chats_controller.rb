class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :destroy]

    def index
        if true
            @chats = Chat.all.select { |c| c.primary_id == User.first.id }
        else
            redirect_to new_user_path
        end
        
    end

    def show
        @message = @chat.messages.build(user_id: User.first.id)
        @messages = @chat.messages[0...-1]
    end

    def new
        @chat = Chat.new
    end

    def create
        @chat = Chat.create(chat_params)

        if @chat.valid?
            flash[:notice] = "chat successfully created"
            redirect_to @chat
        else
            render :new
        end
    end

    def destroy
        @chat.destroy
        redirect_to chats_path
    end

    private

    def chat_params
        params.require(:chat).permit(
            :primary_id,
            :secondary_id
        )
    end


    def set_chat
        @chat = Chat.find(params[:id])
    end
end
