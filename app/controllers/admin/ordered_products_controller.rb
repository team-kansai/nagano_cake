class Admin::OrderedProductsController < ApplicationController

  def update
    @order_products = OrderedProduct.find(params[:id])
    @order_products.update(production_status: params[:ordered_product][:production_status])
    redirect_to admin_order_path(params[:order_id])
  end

  private
  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end
    

end
