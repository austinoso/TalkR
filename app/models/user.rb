class User < ApplicationRecord
    # belongs_to :user1, class_name: 'User'
    # belongs_to :user2, class_name: 'User'

    has_many :primary_users, foreign_key: :primary_id, class_name: 'Chat'
    has_many :secondaries, through: :primary_users

    has_many :secondary_users, foreign_key: :secondary_id, class_name: 'Chat'
    has_many :primaries, through: :secondary_users

    has_many :chats, as: :primary
    has_many :messages
    has_many :user_languages
    has_many :languages, through: :user_languages

    # def chats
    #     Chat.all.find_by(primary_id: self.id)
    # end
end

