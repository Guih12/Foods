class PlaceOrderProductItem < ApplicationRecord
  belongs_to :place_order
  belongs_to :product, class_name: "Product::Record"
end
