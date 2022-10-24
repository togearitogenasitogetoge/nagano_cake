class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    # binding.pry
    @order.update(order_product_params)

    if @order_product.work_status == "製作中"
      @order.update(status: 2)
      # @order.save
    end

    if @order.order_products.quantity == @order.order_products.where(work_status:3).quantity
     @order.update(status: 3)
      # @order.save
    end


  end

  private

  def order_product_params
    # f.fieldの話で他の情報はいるのか
    # params.require(:order_product).permit(:work_status)
    params.require(:order_product).permit(:order_id, :work_status, :product_id, :quantity, :tax_included_price)
  end

end
