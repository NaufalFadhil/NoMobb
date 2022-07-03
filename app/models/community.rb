class Community < ApplicationRecord
    validates :sender, :title, :message_preview, presence: true

    belongs_to :user, foreign_key: 'sender'
end
