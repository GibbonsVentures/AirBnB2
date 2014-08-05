class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end
  end
end
