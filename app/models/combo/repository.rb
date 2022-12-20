module Combo
  module Repository
    extend self
    def create(combo_params:)
      combo = Record.create(combo_params)
      [combo.persisted?, combo]
    end

    def update(combo_id:, combo_params:)
      combo ||= Record.find(combo_id)
      return combo if combo.update(combo_params)
    end

    def find_by_id(combo_id:)
      Record.find(combo_id)
    end
  end
end