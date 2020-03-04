class Chat < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_users
    has_many :users, through: :chat_users

    belongs_to :owner, class_name: :User

    accepts_nested_attributes_for :chat_users

    def name
        self.members
    end
end
