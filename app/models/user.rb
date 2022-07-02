class User < ApplicationRecord
    has_secure_password
    validates :name, :email, presence: true
    validates :phone, presence: true, numericality: true
    validates :is_verified, inclusion: { in: [true, false] }
    validates :email, :phone, uniqueness: { case_sensitive: false }, on: :create
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :role, presence: true, inclusion: { in: ["ADMIN", "BASIC", "PSIKOLOGIST", "INSTITUTION"] }

end