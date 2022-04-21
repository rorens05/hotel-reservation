class CreateBookingTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.decimal :price, precision: 16, scale: 2
      t.datetime :schedule
      t.integer :status, default: 0
      t.integer :payment_method, default: 0
      t.text :note

      t.timestamps
    end
  end
end
