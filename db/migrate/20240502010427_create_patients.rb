class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.string :email
      t.string :diagnostic
      t.string :phone, null: false
      t.string :address
      t.string :civil_state
      t.integer :children
      t.string :instruction_grade
      t.string :occupation

      t.timestamps
    end
  end
end
