class AddColumnToRenters < ActiveRecord::Migration[6.0]
  def change
    add_column :renters, :password_digest, :string
  end
end
