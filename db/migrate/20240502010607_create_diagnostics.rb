class CreateDiagnostics < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnostics do |t|
      t.text :description, null: false
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
