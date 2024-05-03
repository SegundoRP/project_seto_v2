class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.interval :duration, null: false
      t.date :start_time, null: false
      t.text :about, null: false
      t.references :diagnostic, null: false, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
