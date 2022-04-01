module Products
  class Update
    def initialize(product, product_attributes)
      @product = product
      @product_attributes = product_attributes
    end

    def persist
      return product if product.update(@product_attributes)

      product.errors
    end

    private

    attr_reader :product
  end
end
