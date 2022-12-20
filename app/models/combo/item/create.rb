module Combo
  module Item
    class Create
      private attr_accessor :params, :repository, :combo_id

      def initialize(combo_id:, params:, repository:)
        self.combo_id   = combo_id
        self.params     = params
        self.repository = repository
      end

      def persist
        params&.each{ |param| repository.create(combo_id: combo_id, product_id: param[:product_id]) }
      end
    end
  end
end
