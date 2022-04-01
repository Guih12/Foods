class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: collection, status: 200
  end

  def show
    render json: product, status: 200
  end

  def create
    @new_product = Products::Create.new(product_attributes).persist
    if !@new_product.errors.present?
      render json: { product: @new_product }, status: 201
    else
      render json: @new_product, status: 422
    end
  end

  def update
    @update_product = Products::Update.new(product, product_attributes).persist
    if !@update_product.errors.present?
      render json: @update_product, status: 201
    else
      render json: @update_product, status: 422
    end
  end

  private

  def collection
    @collection ||= Product.all
  end

  def product
    @product = Product.find(params[:id])
  end

  def product_attributes
    params.require(:product).permit(:name, :description, :type_product, :price)
  end
end
