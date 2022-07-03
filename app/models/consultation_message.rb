class ConsultationMessage < ApplicationRecord
    validates :roomchat_id, :sender, :receiver, numericality: true, presence: true
    validates :message, presence: true
    
    belongs_to :user, foreign_key: 'sender'
    belongs_to :user, foreign_key: 'receiver'
end
