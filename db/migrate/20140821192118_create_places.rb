class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :user_id
      t.string :address
      t.integer :price
      t.text :description
      t.string :availability
      t.string :kind
      t.string :state

      t.timestamps
    end
    add_index :places, :user_id
  end
end
