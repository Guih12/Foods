module Products
  class Create
    def initialize(product_attributes)
      @product_attributes = product_attributes
    end

    def persist
      create_product
    end

    private

    attr_reader :product_attributes

    def create_product
      product = ::Product.new(product_attributes)
      return product if product.save
      product.errors
    end

  end
end