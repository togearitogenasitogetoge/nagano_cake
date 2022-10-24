class Public::DeliveriesController < ApplicationController
before_action :authenticate_customer!

  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer = current_customer
    if @delivery.save
       redirect_to deliveries_path
    else
       @deliveries = current_customer.deliveries
       render :index
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
      render :edit
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
