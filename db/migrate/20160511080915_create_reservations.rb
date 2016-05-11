class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :user_id, index: true, null: false
      t.integer :listing_id, index: true, null: false
      t.integer :price
      t.integer :pax
      t.timestamps null: false
    end
  end
end
