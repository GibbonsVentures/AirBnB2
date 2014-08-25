class AddPlaceIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :place_id, :integer
  end
end
