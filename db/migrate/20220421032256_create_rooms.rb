class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 16, scale: 2

      t.timestamps
    end
  end
end
