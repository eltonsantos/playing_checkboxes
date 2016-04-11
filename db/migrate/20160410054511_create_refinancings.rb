class CreateRefinancings < ActiveRecord::Migration
  def change
    create_table :refinancings do |t|
      t.integer :employee_id
      t.integer :authorization_id
      t.string :contract_number
      t.integer :situation
      t.decimal :total_value
      t.decimal :parcel_value
      t.integer :qtd_parcel
      t.date :refinancing_date

      t.timestamps null: false
    end
  end
end
