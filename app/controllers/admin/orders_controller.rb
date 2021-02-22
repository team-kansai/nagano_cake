class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.ordered_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :postage, :total_price, :order_status)
  end
    
end
