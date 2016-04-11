class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :person_id
      t.string :register
      t.decimal :salary

      t.timestamps null: false
    end
  end
end
