class CreateTypeOfServices < ActiveRecord::Migration[7.1]
  def change
    create_table :type_of_services do |t|
      t.string :name_of_service, null: false

      t.timestamps
    end
  end
end
