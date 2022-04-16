class PlaceOrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :data, :code, :status, :price, :price_with_discount, :user, :combos, :products
end
