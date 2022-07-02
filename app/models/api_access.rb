class ApiAccess < ApplicationRecord
    validate :expired_date_cannot_be_in_the_past
    validates :user_id, numericality: true, presence: true
    validates :token, uniqueness: true, presence: true
    validates :expired_date, presence: true

    belongs_to :user, foreign_key: 'user_id'

    def expired_date_cannot_be_in_the_past
        if expired_date.present? && expired_date < Date.today
            errors.add(:expired_date, "can't be in the past")
        end
    end   
end
