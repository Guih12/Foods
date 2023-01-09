module PlaceOrder
  module Product
    module Item
      module Repository
        extend self
        def create(place_order_id:, product_id:)
          PlaceOrder::Product::Item::Record.create(
            place_order_id: place_order_id,
            product_id: product_id
          )
        end
      end
    end
  end
end
