class Admin::OrdersController < ApplicationController

  def show
    @order=Order.find(params[:id])
  end

  private

  def order_status_params
    params.require(:order).permit(:customer_id,:payment_method,:order_status,:shipping_fee,:request_amount,:name,:postal_code,:address)
  end
end
