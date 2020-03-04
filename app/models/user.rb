class User < ApplicationRecord
    # belongs_to :user1, class_name: 'User'
    # belongs_to :user2, class_name: 'User'
    has_secure_password
    # has_secure_password :password, validations: true

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    # has_many :primary_users, foreign_key: :primary_id, class_name: 'Chat'
    # has_many :secondaries, through: :primary_users

    # has_many :secondary_users, foreign_key: :secondary_id, class_name: 'Chat'
    # has_many :primaries, through: :secondary_users

    has_many :chat_users
    has_many :chats, foreign_key: :owner_id
    has_many :messages
    has_many :user_languages
    has_many :languages, through: :user_languages

end

