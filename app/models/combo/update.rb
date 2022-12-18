module Combo
  class Update
    def initialize(combo_id:, combo_attribute:, repository:)
      @combo_id            = combo_id
      @combo_attribute    = combo_attribute
      @repository          = repository
    end

    def persist
      @repository.update(combo_id: @combo_id, combo_params: @combo_attribute)
    end
  end
end
