class Language < ApplicationRecord
    has_many :users, through: :user_languages
end
