class AddPriceWithDiscountPlaceOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :place_orders, :price_with_discount, :float
  end
end
