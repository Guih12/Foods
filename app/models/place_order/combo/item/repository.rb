module PlaceOrder
  module Combo
    module Item
      module Repository
        extend self
        def create(place_order_id:, combo_id:)
          Combo::Item::Record.create(place_order_id: place_order_id, combo_id: combo_id)
        end
      end
    end
  end
end