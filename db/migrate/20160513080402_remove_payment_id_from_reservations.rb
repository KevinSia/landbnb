class RemovePaymentIdFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :payment_id, :integer
  end
end
