class Owner < ApplicationRecord
    has_secure_password
    has_many :appliances
    has_many :bookings, through: :appliances

    validates :username, uniqueness: true
    validates :username, length: { in: 6..20 }
    validates :password, length: { in: 6..20 }, on: :create
end
