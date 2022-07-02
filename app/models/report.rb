class Report < ApplicationRecord
    validates :reason, presence: true
    validates :proof, presence: true
    validates :witness, presence: true
    validates :incident_location, presence: true
end
