module Combos
  class Create
    def initialize(combo_attributes)
      @combo_attributes = combo_attributes
    end

    def persist
      create_combo
    end

    private

    attr_reader :combo_attributes

    def create_combo
      combo = ::Combo.new(combo_attributes)
      return combo if combo.save
    end
  end
end