class Report < ApplicationRecord
    validates :perpetrator, presence: true
    validates :reason, presence: true
    validates :proof, presence: true
    validates :witness, presence: true
    validates :incident_location, presence: true
end
