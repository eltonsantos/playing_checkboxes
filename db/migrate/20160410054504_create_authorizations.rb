class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.integer :employee_id
      t.string :contract_number
      t.integer :situation
      t.decimal :total_value
      t.decimal :parcel_value
      t.integer :qtd_parcel
      t.decimal :value_solve

      t.timestamps null: false
    end
  end
end
