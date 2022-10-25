class Public::ProductsController < ApplicationController

  def index
    @genres = Genre.all
    @products = Product.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    @genres = Genre.all

  end

end
