class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :booking_id
      t.float :rating
      t.string :text_review

      t.timestamps
    end
  end
end
