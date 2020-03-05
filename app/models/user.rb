class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :chat_users
    has_many :chats, foreign_key: :owner_id
    has_many :messages
    belongs_to :language

    # has_many :user_languages
    # has_many :languages, through: :user_languages

end

