# frozen_string_literal: true

module PlaceOrder
  module Product
    module Item
      class Create
        private attr_accessor :place_order_id, :product_items_attributes, :repository

        def initialize(place_order_id:, product_items_attributes:, repository:)
          self.place_order_id           = place_order_id
          self.product_items_attributes = product_items_attributes
          self.repository               = repository
        end

        def persist
          product_items_attributes&.each do |product|
            repository.create(place_order_id: place_order_id, product_id: product[:product_id])
          end
        end
      end
    end
  end
end
