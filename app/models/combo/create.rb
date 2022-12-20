module Combo
  class Create
    private attr_accessor :attributes, :repository

    def initialize(attributes, repository)
      self.attributes = attributes
      self.repository = repository
    end

    def persist
      persisted, combo = repository.create(combo_params: params)
      combo_item if persisted
      combo
    end

    private

    def params
      Combo::Attributes::Create.call(attributes)
    end

    def combo_item(combo)
      Combo::Item::Create.new(
        combo_id: combo.id
        params: attributes[:combo_item_attributes],
        repository: Combo::Item::Repository
      ).persist
    end
  end
end
