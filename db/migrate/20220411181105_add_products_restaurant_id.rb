class AddProductsRestaurantId < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :restaurant, index: true
  end
end
