class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end

  def create
  end

end
