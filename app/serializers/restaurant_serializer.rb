class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :number_phone
end
