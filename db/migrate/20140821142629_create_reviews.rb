class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :place_id
      t.string :experience

      t.timestamps
    end
  end
end
