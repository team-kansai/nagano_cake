class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm
    @cart = CartProduct.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    if  params[:order][:shipping_address] == "0"
      @order.address = current_customer.address
      @order.postcode = current_customer.postcode
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:shipping_address] == "1"
      shipping_address = ShippingAddress.find(params[:order][:address_index])
      @order.address = shipping_address.address
      @order.postcode = shipping_address.postcode
      @order.name = shipping_address.name
    end

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @carts = current_customer.cart_products
    @carts.each do |f|
      new_order_product = OrderedProduct.new
      new_order_product.order_id = @order.id
      new_order_product.product_id = f.product_id
      new_order_product.quantity = f.quantity
      new_order_product.with_tax_price = f.product.price*1.10
      new_order_product.production_status = 0
      new_order_product.save
    end
    @carts.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :postage, :total_price, :order_status)
  end

end
