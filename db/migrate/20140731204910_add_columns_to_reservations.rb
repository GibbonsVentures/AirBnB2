class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :check_in, :date
    add_column :reservations, :check_out, :date
    add_column :reservations, :place_id, :integeruser_id
  end
end
