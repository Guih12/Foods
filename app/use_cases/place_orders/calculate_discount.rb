module PlaceOrders
  class CalculateDiscount
    def initialize(place_order)
      @place_order = place_order
    end

    PERCENTS = {
      seventeen: 0.17,
      ten: 0.10,
      five: 0.05,
      zero: 0.00
    }

    def calculate_discount
      return discount_seventeen_percent if verification_combo_and_lanche
      return discount_ten_percent if verification_combo

      return discount_five_percent if verification_lanche

      discount_zero_percent
    end

    def verification_combo_and_lanche
      verification_combo && verification_lanche
    end

    def verification_combo
      place_order.combos.count >= 2
    end

    def verification_lanche
      place_order.products.count >= 2
    end

    private

    attr_reader :place_order

    def discount_seventeen_percent
      PERCENTS[:seventeen]
    end

    def discount_ten_percent
      PERCENTS[:ten]
    end

    def discount_five_percent
      PERCENTS[:five]
    end

    def discount_zero_percent
      PERCENTS[:zero]
    end
  end
end
