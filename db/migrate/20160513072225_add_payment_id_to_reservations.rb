class AddPaymentIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :payment_id, :integer
  end
end
