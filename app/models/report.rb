class Report < ApplicationRecord
    validates :perpetrator_detail_id, presence: true
    validates :reason, presence: true
    validates :proof, presence: true
    validates :witness, presence: true
    validates :incident_location, presence: true
end
