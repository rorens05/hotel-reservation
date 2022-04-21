class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.integer :hotel_id
      t.integer :room_id
      t.integer :file_type, default: 0

      t.timestamps
    end
  end
end
