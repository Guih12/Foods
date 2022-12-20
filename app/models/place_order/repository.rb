module PlaceOrder
  module Repository
    extend self
    def create_order(order_params:)
      order = Record.create(order_params)
      [order.persisted?, order]
    end
  end
end