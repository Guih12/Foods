module PlaceOrder
  class Create

    private attr_accessor :place_order_attributes, :repository

    def initialize(place_order_attributes, repository)
      self.place_order_attributes = place_order_attributes
      self.repository             = repository
    end

    def persist
      persisted, place_order = repository.create_order(order_params: order_params)
      combo_item(place_order) if persisted
      place_order
    end

    private

    def update_price_after_create(place_order)
      PlaceOrders::UpdatePriceAfterCreate.new(place_order).update_price
    end

    def order_params
      {
        user_id: place_order_attributes[:user_id],
        restaurant_id: place_order_attributes[:restaurant_id],
        status: false,
        code: PlaceOrder::Code::Create.call
      }
    end

    def combo_item(place_order)
      Combo::Item::Create.new(
        place_order_id: place_order.id, 
        combo_item_attributes: place_order_attributes[:place_order_combo_items_attributes],
        repository: PlaceOrder::Combo::Item::Repository
      ).persist
    end

    def product_item
      NotImplementedError
    end

  end
end
