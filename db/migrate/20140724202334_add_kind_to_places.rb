class AddKindToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :kind, :string
  end
end
