class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
  end
  
  @customer=Customer.find(params[:id])
    @order=Order.find(params[:id])
    @order_product=@order.order_products
end
