class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_product = @order.ordered_products
  end

def update
  @order = Order.find(params[:id])
  @order.update(order_params)
  @order_product = @order.ordered_products
  if @order.order_status == "入金確認"
    @order_product.update_all(production_status: "製作待ち" )
  end
  redirect_to admin_order_path(@order)
end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :postage, :total_price, :order_status)
  end

end
