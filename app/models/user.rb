class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :chat_users
    has_many :chats, foreign_key: :owner_id
    has_many :messages
    belongs_to :language

    # contacts = your contacts (followers)
    # contacted = users who have you as contact (followed)

    has_many :contacts, foreign_key: :contact_id, class_name: "Contact"
    has_many :contacted, through: :contacts
    has_many :contacted, foreign_key: :contacted_id, class_name: "Contact"
    has_many :contacts, through: :contacted


end

