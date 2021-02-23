class Admin::OrderedProductsController < ApplicationController

def update
  @order_product = OrderedProduct.find(params[:id])
  @order_product.update(production_status: params[:ordered_product][:production_status])
  @order = @order_product.order
  if @order_product.production_status == "製作中"
    @order.update(order_status: "製作中" )
  elsif @order_product.order.ordered_products.all?{|ordered_product| ordered_product.production_status == "製作完了" }
    @order.update(order_status: "発送準備中" )
  end
  redirect_to admin_order_path(params[:order_id])
end

  private
  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end


end
