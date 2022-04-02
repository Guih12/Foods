class ComboSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :price
end
