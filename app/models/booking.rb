class Booking < ApplicationRecord
    belongs_to :renter
    belongs_to :appliance
    has_many :owners, through: :appliances
    has_one :review

    # validates :availabilty, 

    

end
