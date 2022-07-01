class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :is_verified, inclusion: { in: [true, false] }
    validates :role, presence: true, inclusion: { in: ["ADMIN", "BASIC", "PSIKOLOGIST", "INSTITUTION"] }
    validates :email, :phone, presence: true
    validates :email, :phone, uniqueness: { case_sensitive: false }, on: :create
end