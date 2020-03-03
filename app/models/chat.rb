class Chat < ApplicationRecord
    belongs_to :primary, class_name: 'User'
    belongs_to :secondary, class_name: 'User'

    #belongs_to :user

    has_many :messages, dependent: :destroy
end
