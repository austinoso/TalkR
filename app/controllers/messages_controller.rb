class MessagesController < ApplicationController

    def show
    end

    def create
        @msg = Message.create(content: msg_params[:content], user_id: current_user.id, chat_id: session[:chat_view_id])
        @msg.user_id = session

        if @msg.save
            ActionCable.server.broadcast "room_channel", content: @msg.content
        end

        #redirect_to @msg.chat
        redirect_to chats_path
    end

    def destroy
    end
    
    private

    def msg_params
        params.permit(
            :content
        )
    end
end
