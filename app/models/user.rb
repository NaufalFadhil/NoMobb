class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :password, presence: true
    validates :is_verified, presence: true
    validates :role, presence: true
end
