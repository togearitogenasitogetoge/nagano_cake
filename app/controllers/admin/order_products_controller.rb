class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order

    @order_product.update(order_product_params)
    if @order_product.work_status == "製作中"
      @order.update(order_status:"製作中")
    end



    if @order_product.work_status == "制作完了"
      @order.update(order_status:"発送準備中")
    end

      # @order.update(order_status: 2)
      # @order.save
    # end

    #if @order_product.update(order_product_params)
    # @order.update_all(order_status: 3) if @order_product.work_status == 3
    #end


      # if @order_product.update(order_product_params)
      # @order_product.work_status == "in_production"
      # @order.update(order_status: 3)
      # @order.save
      # end

  redirect_to request.referer
    # end
  end



  private

  def order_product_params
    # f.fieldの話で他の情報はいるのか
     params.require(:order_product).permit(:work_status)
  end

end
