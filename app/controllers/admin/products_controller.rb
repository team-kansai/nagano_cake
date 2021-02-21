class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(8)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save(product_params)
    redirect_to admin_product_path(@product)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(params[:id])
  end

    private

  def product_params
    params.require(:product).permit(:genre_id, :image, :name, :description, :price, :is_active)
  end

end
