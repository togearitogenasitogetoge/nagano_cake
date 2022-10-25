class Public::HomesController < ApplicationController
  def top
    @products = Product.all.order(created_at: :desc)
    @genres = Genre.all
    # desc 新しい:降順　asc　古い：昇順
    # @genre = Genre.all
  end

  def about
  end
end
