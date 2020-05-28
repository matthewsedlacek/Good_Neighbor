class Appliance < ApplicationRecord
    belongs_to :owner
    has_many :bookings
    has_many :users, through: :bookings
    has_one_attached :avatar
end
