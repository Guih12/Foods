module Combos
  class Update
    def initialize(combo, combo_attributes)
      @combo = combo
      @combo_attributes = combo_attributes
    end

    def persist
      return combo if combo.update(combo_attributes)

      combo.errors
    end

    private

    attr_reader :combo, :combo_attributes
  end
end