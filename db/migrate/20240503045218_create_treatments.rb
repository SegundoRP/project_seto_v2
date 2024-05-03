class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.interval :duration
      t.date :start_time
      t.text :about
      t.references :diagostic, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
