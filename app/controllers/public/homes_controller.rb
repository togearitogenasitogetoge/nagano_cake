class Public::HomesController < ApplicationController
  def top
    @products = Product.all.order(created_at: :desc)
    @genres = Genre.all
  end

  def about
  end
end
