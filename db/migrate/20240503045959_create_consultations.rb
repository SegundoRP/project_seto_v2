class CreateConsultations < ActiveRecord::Migration[7.1]
  def change
    create_table :consultations do |t|
      t.datetime :date, null: false
      t.integer :status, null: false, default: 0
      t.text :summary
      t.string :reason_consultation
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :type_of_service, null: false, foreign_key: true
      t.decimal :price, null: false, precision: 7, scale: 1

      t.timestamps
    end
  end
end
