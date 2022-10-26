class Public::CustomersController < ApplicationController

  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    if @customer=Customer.update(customer_params)
      redirect_to customers_my_page_path(current_customer)
    else
      render 'customer/information/edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(customer_status: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:family_name,:first_name,:kana_family_name,:kana_first_name,:postal_code,:address,:customer_status,:phone_number)

  end

end
