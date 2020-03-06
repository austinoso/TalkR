class MessagesController < ApplicationController

    def show
    end

    def create
        @msg = Message.create(msg_params)
        @msg.user_id = session

        redirect_to chats_path
    end

    def destroy
    end
    
    private

    def msg_params
        params.require(:message).permit(
            :content,
            :user_id,
            :chat_id
        )
    end
end
