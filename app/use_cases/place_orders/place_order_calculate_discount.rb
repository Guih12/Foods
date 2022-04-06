module PlaceOrders
  class PlaceOrderCalculateDiscount
    def initialize(place_order)
      @place_order = place_order
    end

    PERCENTS = {
      twenteen: 0.17,
      teen: 0.10,
      five: 0.05
    }

    def calculate_discount
      return discount_twenteen_percent if verification_combo_and_lanche
      return discount_teen_percent if verification_combo

      discount_five_percent if verification_lanche
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

    def discount_twenteen_percent
      PERCENTS[:twenteen]
    end

    def discount_teen_percent
      PERCENTS[:teen]
    end

    def discount_five_percent
      PERCENTS[:five]
    end
  end
end
