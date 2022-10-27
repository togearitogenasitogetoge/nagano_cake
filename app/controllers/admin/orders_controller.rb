class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order=Order.find(params[:id])
    @order_product=@order.order_products
    @total = @order_product.inject(0) { |sum, order_product| sum + (order_product.product.tax_excluded_price * order_product.quantity) }
    @total = @total * 1.1
    @order.request_amount = @total + 800
  end

  def update
    @order=Order.find(params[:id])
    @order_product=@order.order_products
    @order.update(order_status_params)
      if @order.order_status == "payment_confirmation"
      @order_product.update_all(work_status: "production_pending")
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
