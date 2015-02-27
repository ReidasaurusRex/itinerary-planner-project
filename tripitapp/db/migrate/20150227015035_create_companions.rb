class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.integer :user_id
      t.integer :itinerary_id
      t.integer :destination_id

      t.timestamps null: false
    end
  end
end
