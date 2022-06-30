class User < ApplicationRecord
    validates :name, :email, :phone, :password, :role, presence: true
    validates :is_verified, inclusion: { in: [true, false] }
end
