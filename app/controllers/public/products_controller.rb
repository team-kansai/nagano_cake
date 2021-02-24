class Public::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).reverse_order.per(8)
    @products_all = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = CartProduct.new
  end

  private

  def product_params
    params.require(:product).permit(:genre, :image_id, :name, :description, :price, :is_active)
  end

end
