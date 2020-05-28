class Owner < ApplicationRecord
    has_secure_password
    has_many :appliances
    has_many :bookings, through: :appliances

    validates :username, uniqueness: true
    validates :username, length: { in: 6.. 20 }
    validates :password, uniqueness: true
    validates :password_digest, length: { in: 6..20 }
end
