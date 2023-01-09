module PlaceOrder
  class UpdatePriceAfterCreate
    def initialize(place_order)
      @place_order = place_order
    end

    def update_price
      @place_order.update_attribute :price, calculate_price_total
      @place_order.update_attribute :price_with_discount, calculate_price_with_discount
    end

    private

    def calculate_price_total
      calculate_price.calculate_total
    end

    def calculate_price_with_discount
      calculate_price.calculate_price_with_discount
    end

    def calculate_price
      PlaceOrder::CalculatePrice.new(@place_order)
    end
  end
end
