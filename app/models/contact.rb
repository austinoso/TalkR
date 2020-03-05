class Contact < ApplicationRecord
    belongs_to :contact, class_name: "User"
    belongs_to :contacted, class_name: "User"
end
