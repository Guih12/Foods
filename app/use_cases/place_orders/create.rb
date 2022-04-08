module PlaceOrders
  class Create
    def initialize(place_order_attributes)
      @place_order_attributes = place_order_attributes
    end

    def persist
      @place_order = ::PlaceOrder.new(place_order_attributes)
      if @place_order.save
        update_price_after_create(find_place_order(@place_order))
        @place_order
      end
      @place_order.errors
    end

    private

    attr_reader :place_order_attributes


    def find_place_order(place_order)
      ::PlaceOrder.find(place_order.id)
    end

    def update_price_after_create(place_order)
      PlaceOrders::UpdatePriceAfterCreate.new(place_order).update_price
    end
  end
end