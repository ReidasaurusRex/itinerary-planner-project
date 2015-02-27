class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.date :start_date
      t.date :end_date
      t.string :origin
      t.string :destination
      t.string :name
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
