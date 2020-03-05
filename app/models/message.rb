class Message < ApplicationRecord
    belongs_to :user
    belongs_to :chat

    GOOGLE_APPLICATION_CREDENTIALS = "app/assets/config/TalkR-78c26166b3df.json"
end
