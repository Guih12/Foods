class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :type_product, :price
end
