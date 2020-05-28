class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :renter_id
      t.integer :appliance_id
    end
  end
end
