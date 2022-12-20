module Combo
  module Item
    class Create
      private attr_accessor :params, :repository

      def initialize(combo_id: ,params:, repository:)
        self.combo_id   = combo_id
        self.params     = params
        self.repository = repository

        binding.pry
      end

      def persist
        repository.create(combo_id: params[:combo_id], product_id: params[:product_id])
      end
    end
  end
end
