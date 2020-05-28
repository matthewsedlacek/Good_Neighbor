class AddColumnToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :password_digest, :string
  end
end
