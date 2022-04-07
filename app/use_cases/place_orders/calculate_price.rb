module PlaceOrders
  class CalculatePrice
    def initialize(place_order)
      @place_order = place_order
    end


    def calculate_total
      (total_combo + total_products)
    end

    def calculate_price_with_discount
      calculate_total - (calculate_total * calculate_discount)
    end

    private

    attr_reader :place_order

    def total_combo
      place_order.combos.map(&:price).sum
    end

    def total_products
      place_order.products.map(&:price).sum.to_f
    end

    def calculate_discount
      PlaceOrders::CalculateDiscount.new(place_order).calculate_discount
    end
  end
end