class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :phone
      t.string :email
      t.text :rules_and_policy

      t.timestamps
    end
  end
end
