class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order

    @order_product.update(order_product_params)
    if @order_product.work_status == "in_production"
      @order.update(order_status:"in_production")
    end



    # if @order_product.work_status == "制作完了"
      # @order.update(order_status:"発送準備中")
    # end

    if @order.order_products.count == @order.order_products.where(work_status: "production_complete").count
      @order.update(order_status: "preparing_delivery")
    end




  redirect_to request.referer
    # end
  end



  private

  def order_product_params
    # f.fieldの話で他の情報はいるのか
     params.require(:order_product).permit(:work_status)
  end

end
