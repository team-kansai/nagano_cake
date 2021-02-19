class Public::HomesController < ApplicationController

  def top
    @products = Product.last(4).reverse
  end

  def about
  end

end
