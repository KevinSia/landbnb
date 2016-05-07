class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :home_type
      t.string :room_type
      t.integer :guest_number
      t.integer :price_per_night

      t.timestamps null: false
    end
  end
end
