module Combo
  module Repository
    extend self
    def create(name:, description:, price:, combo_items_attributes:, restaurant_id:)
      combo = Record.new(
        name:                   name, 
        description:            description, 
        price:                  price, 
        combo_items_attributes: combo_items_attributes,
        restaurant_id:          restaurant_id
      )

      binding.pry

      return combo if combo.save
      combo.errors
    end
  end
end