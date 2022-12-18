module Combo
  module Item
    class Create
      private attr_accessor :params, :repository

      def initialize(params:, repository:)
        self.params     = params
        self.repository = repository
      end

      def persist
        repository.create(combo_id: params[:combo_id], product_id: params[:product_id])
      end
    end
  end
end
