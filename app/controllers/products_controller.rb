class ProductsController < ApplicationController
  def index
    render json: {:ok => collection}, status: 200
  end

  def show
    render json: {:ok => 1}, status: 200
  end

  def create
    @new_product = Products::Create.new(product_attributes).persist
    if !@new_product.errors.present?
      render json: {product: @new_product}, :status => 201
    else
      render json: @new_product, :status => 403
    end
  end

  private

  def collection
    @collection ||= Product.all
  end

  def product_attributes
    params.require(:product).permit(:name, :description, :type_product, :price)
  end

end