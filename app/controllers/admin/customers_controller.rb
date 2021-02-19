class Admin::CustomersController < ApplicationController

  def index
    @customer_all = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update
    redirect_to admin_customer(@customer)
  end

end