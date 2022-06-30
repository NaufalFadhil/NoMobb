class User < ApplicationRecord
    has_secure_password
    validates :email, :phone, presence: true, uniqueness: { case_sensitive: false }, on: :create
    validates :name, :email, :phone, :password, :role, presence: true
    validates :is_verified, inclusion: { in: [true, false] }
end