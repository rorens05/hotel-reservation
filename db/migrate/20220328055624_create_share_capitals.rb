class CreateShareCapitals < ActiveRecord::Migration[6.0]
  def change
    create_table :share_capitals do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.text :content
      t.text :admin_note
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
