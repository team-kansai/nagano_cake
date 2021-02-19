class Admin::ProductsController < ApplicationController

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
    @product = Product.new(post_product_params)
    @product.save
    redirect_to admin_product_path(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update
    redirect_to admin_product_path(params[:id])
  end

    private

  def post_product_params
    params.require(:product).permit(:genre_id, :image_id, :name, :description, :price, :is_active)
  end

end
