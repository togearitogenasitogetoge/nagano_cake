class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products


  end

  def update
    @order=Order.find(params[:id])
    @order_product = @order.order_products
    @order.update(order_status_params)
    if @order.order_status == "入金確認"
      @order_product.update_all(work_status:"制作待ち")
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def order_status_params
    params.require(:order).permit(:order_status)
  end
end
