module Combo
  class Create
    private attr_accessor :attributes, :repository

    def initialize(attributes, repository)
      self.attributes = attributes
      self.repository = repository
    end

    def persist
      repository.create(
        name: attributes[:name],
        description: attributes[:description],
        price: attributes[:price],
        combo_items_attributes: attributes[:combo_items_attributes],
        restaurant_id: attributes[:restaurant_id]
      )
    end
  end
end
