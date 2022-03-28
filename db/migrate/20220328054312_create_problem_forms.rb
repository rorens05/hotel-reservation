class CreateProblemForms < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date_of_incident
      t.string :place
      t.text :content
      t.text :admin_note
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
