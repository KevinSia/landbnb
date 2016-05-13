class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id, index: true, null: false
      t.integer :reservation_id, index: true, null: false
      t.timestamps null: false
    end
  end
end
