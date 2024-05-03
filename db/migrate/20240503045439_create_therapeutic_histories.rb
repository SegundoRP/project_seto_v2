class CreateTherapeuticHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :therapeutic_histories do |t|
      t.boolean :first_time_attention
      t.string :previous_diagnostic
      t.text :events_in_life
      t.text :previous_treatment
      t.text :familiar_antecedents
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
