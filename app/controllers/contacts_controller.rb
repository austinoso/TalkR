class ContactsController < ApplicationController
    def index
        @contacts = current_user.contacts
    end

    def show
        @contacts = current_user.contacts
        @contact = @contacts.find(params[:id]) if @contacts.find(params[:id])
    end

    def destroy
        current_user.contacts.delete(@user)
        redirect_to contacts_path
    end
end