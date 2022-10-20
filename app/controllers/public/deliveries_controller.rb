class Public::DeliveriesController < ApplicationController

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
       redirect_to deliveries_path
    else
       @deliveries = Delivery.all
       render "index"
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
       render request.referer
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  # 配送先用のストロングパラメータ　userと紐づけ後エラー解消となるはず
  # 現在はAuthentic　Tokenのエラーが出てしまっている
  private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :postal_code, :address, :name)
    # customerid必要？
  end

end
