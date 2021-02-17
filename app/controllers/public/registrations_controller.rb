class Public::RegistrationsController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to customers_my_page_path
  end

  
  private
  def customer_params
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :email, :postcode, :address, :phone_number, :password)
  end
end