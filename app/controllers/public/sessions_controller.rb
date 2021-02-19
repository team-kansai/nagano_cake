class Public::SessionsController < ApplicationController

  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new()
  end


  def destroy
  end

end