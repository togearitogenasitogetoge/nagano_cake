class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

 private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :phone_number)
    # 会員ステータスは作成してから追加する（？）
  end

end

