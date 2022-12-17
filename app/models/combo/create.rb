module Combo
  class Create
    def initialize(attributes, repository)
      @attributes = attributes
      @repository = repository
      binding.pry
    end

    def persist
      @repository.create(
        name: @attributes[:name], 
        description: @attributes[:description],
        price: @attributes[:price],
        combo_items_attributes: @attributes[:combo_items_attributes],
        restaurant_id: @attributes[:restaurant_id]
      )
    end
  end
end
