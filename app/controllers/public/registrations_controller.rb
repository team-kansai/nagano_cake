class Public::RegistrationsController < ApplicationController
  
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(configure_permitted_parameters)
    customer.save
  end
  

end