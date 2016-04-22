class CreateHistoricRefinancings < ActiveRecord::Migration
  def change
    create_table :historic_refinancings do |t|
      t.integer :authorization_origin_id
      t.integer :refinancing_id
      t.integer :authorization_new_id

      t.timestamps null: false
    end
  end
end
