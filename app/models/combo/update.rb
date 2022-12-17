module Combo
  class Update
    def initialize(combo_id:, combo_attributes:, repository:)
      @combo_id            = combo_id
      @combo_attributes    = combo_attributes
      @repository          = repository
    end

    def persist
      @repository.update(combo_id: @combo_id, combo_params: @combo_attributes)
    end
  end
end
