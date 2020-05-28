class CreateAppliances < ActiveRecord::Migration[6.0]
  def change
    create_table :appliances do |t|
      t.integer :owner_id
      t.string :appliance_name
      t.string :appliance_category
      t.float :daily_rate
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
