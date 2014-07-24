class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :type
      t.string :address
      t.string :state
      t.integer :price
      t.text :description
      t.string :availability

      t.timestamps
    end
  end
end
