class CreatePlaceOrderProductItems < ActiveRecord::Migration[6.1]
  def change
    create_table :place_order_product_items do |t|
      t.references :place_order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
