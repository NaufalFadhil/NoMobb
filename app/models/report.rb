class Report < ApplicationRecord
    validate :incident_date_cannot_be_in_the_future, :perpetrator_birthday_cannot_be_in_the_future

    validates :reason, :witness, presence: true
    validates :is_valid, inclusion: { in: [true, false] }
    validates :incident_location, :incident_date, presence: true
    validates :perpetrator_fullname, :perpetrator_nickname, presence: true
    validates :proof, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
    validates :status, presence: true, inclusion: { in: ["PENDING", "PROOFED", "NOT PROOFED", "EXPIRED", "CANCELED"] }

    belongs_to :user, foreign_key: 'user_id'

    def perpetrator_birthday_cannot_be_in_the_future
        if perpetrator_birthday.present? && perpetrator_birthday > Date.today
            errors.add(:perpetrator_birthday, "can't be in the future")
        end
    end

    def incident_date_cannot_be_in_the_future
        if incident_date.present? && incident_date > Date.today
            errors.add(:incident_date, "can't be in the future")
        end
    end

end
