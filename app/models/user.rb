class User < ApplicationRecord
    validates :email, :phone, presence: true, uniqueness: true
    validates :name, :email, :phone, :password, :role, presence: true
    validates :is_verified, inclusion: { in: [true, false] }
end