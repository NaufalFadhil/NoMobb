class ApiAccess < ApplicationRecord
    validate :expired_date_cannot_be_in_the_past
    validates :user_id, numericality: true, presence: true
    validates :token, uniqueness: true, presence: true
    validates :expired_date, presence: true

    def generate_token
        self.token = loop do
            random_token = SecureRandom.urlsafe_base64(nil, false)
            break random_token unless ApiAccess.exists?(token: random_token)
        end
    end

    def expired_date_cannot_be_in_the_past
        if expired_date.present? && expired_date < Date.today
            errors.add(:expired_date, "can't be in the past")
        end
    end   
end
