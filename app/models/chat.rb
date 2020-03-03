class Chat < ApplicationRecord
    belongs_to :primary, class_name: 'User'
    belongs_to :secondary, class_name: 'User'
    has_many :messages, dependent: :destroy

    def user
        primary == self ?  primary : secondary
    end
end
