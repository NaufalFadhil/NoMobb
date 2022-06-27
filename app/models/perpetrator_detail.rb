class PerpetratorDetail < ApplicationRecord
    validates :fullname, presence: true
    validates :nickname, presence: true
end
