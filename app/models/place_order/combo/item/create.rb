
module PlaceOrder
  module Combo
    module Item
      class Create
        private attr_accessor :combo_item_attributes, :place_order_id, :repository

        def initialize(place_order_id:, combo_item_attributes:, repository:)
          self.place_order_id        = place_order_id
          self.combo_item_attributes = combo_item_attributes
          self.repository            = repository
        end

        def persist
          combo_item_attributes&.each { |combo| repository.create(place_order_id: place_order_id, combo_id: combo[:combo_id]) }
        end
      end
    end
  end
end