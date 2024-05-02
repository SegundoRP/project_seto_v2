class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.string :profession, null: false
      t.string :specialty
      t.string :college_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
