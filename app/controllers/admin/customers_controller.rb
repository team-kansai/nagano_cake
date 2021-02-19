class Admin::CustomersController < ApplicationController

  def index
    @customer_all = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end

end
