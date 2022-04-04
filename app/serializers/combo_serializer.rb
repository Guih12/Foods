class ComboSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :price

  attribute :products do |object|
    object.products.map do |obj|
      {
        name: obj.name
      }
    end
  end
end
