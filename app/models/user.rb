class User < ApplicationRecord
    has_secure_password
    validates :name, :email, presence: true
    validates :is_verified, inclusion: { in: [true, false] }
    validates :role, presence: true, inclusion: { in: ["ADMIN", "BASIC", "PSIKOLOGIST", "INSTITUTION"] }
    validates :phone, presence: true, numericality: true
    validates :email, :phone, uniqueness: { case_sensitive: false }, on: :create
end