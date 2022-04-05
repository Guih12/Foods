class CreatePlaceOrderComboItems < ActiveRecord::Migration[6.1]
  def change
    create_table :place_order_combo_items do |t|
      t.references :place_order, null: false, foreign_key: true
      t.references :combo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
