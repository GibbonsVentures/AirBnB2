class AddColumnToPlace < ActiveRecord::Migration
  def change
    add_column :places, :uid, :string
  end
end
