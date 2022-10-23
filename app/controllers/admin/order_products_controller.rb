class Admin::OrderProductsController < ApplicationController
  
  def update
    @order_product = OrderProduct.find(params[:id])
    @order.update(order_product_params)
    @order = @order_product.order
    
    
  end
  
  private
  
  def order_product_params
    params.require(:order_product).permit(:order_id, :work_status, :product_id, :quantity, :tax_included_price)
  end  
  
end
