class Review < ApplicationRecord
    belongs_to :booking
    has_many :users, through: :bookings
    has_many :appliances, through: :bookings


end
