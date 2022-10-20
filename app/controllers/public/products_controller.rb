class Public::ProductsController < ApplicationController

  def index
    #@genre = Genre.all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    #@cart_item = CartItem.new
    #genre = Genre.all

  end

end
