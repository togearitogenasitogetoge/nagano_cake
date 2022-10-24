class Admin::OrdersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
    @order=Order.find(params[:id])
    @order_product=@order.order_products
  end

  def update
    @order=Order.find(params[:id])
    if @order.update(order_status_params)
      @order.order_product.update_all(status:1) if @order.status == 1
      redirect_to request.referer
    end
  end

  private

  def order_status_params
    params.require(:order).permit(:order_status)
  end
end
