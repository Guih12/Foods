module Combo
  module Item
    module Repository
      extend self
      def create(combo_id:, product_id:)
        Record.create(combo_id: combo_id, product_id: product_id)
      end
    end
  end
end
