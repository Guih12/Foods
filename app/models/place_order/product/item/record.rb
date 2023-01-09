# frozen_string_literal: true

module PlaceOrder
  module Product
    module Item
      class Record < ApplicationRecord
        self.table_name = 'place_order_product_items'
        belongs_to :place_order, class_name: 'PlaceOrder::Record'
        belongs_to :product, class_name: '::Product::Record'
      end
    end
  end
end
