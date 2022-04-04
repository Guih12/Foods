module Combos
  class SearchCombo
    def initialize(params)
      @params = params
    end

    def search
      return ::Combo.where(Combo.arel_table[:name].matches("#{params}")) unless params.blank?

      []
    end

    private
    attr_reader :params
  end
end