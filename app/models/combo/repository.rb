module Combo
  module Repository
    extend self
    def create(name:, description:, price:, combo_items_attributes:, restaurant_id:)
      combo = Record.new(
        name:                   name, 
        description:            description, 
        price:                  price, 
        restaurant_id:          restaurant_id
      )
      
      return combo if combo.save
      combo.errors
    end

    def update(combo_id:, combo_params:)
      combo ||= Record.find(combo_id)
      return combo if combo.update(combo_params)
    end

    def find_by_id(combo_id:)
      Record.find(combo_id)
    end
  end
end