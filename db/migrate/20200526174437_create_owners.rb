class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :username
      t.string :email_address
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
