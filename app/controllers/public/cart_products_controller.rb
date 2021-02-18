class Public::CartProductsController < ApplicationController

  def index
    @cart = CartProduct.all
  end

  def create
    @cart = current_customer.cart_products.build(cart_product_params)
    @cart.save
    redirect_to cart_products_path
  end

  def update
    @cart = CartProduct.find(params[:id])
    @cart.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart = CartProduct.find(params[:id])
    @cart.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @carts = current_customer.cart_products
    @carts.destroy_all
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:customer_id, :product_id, :quantity)
  end

end
