class Public::CustomersController < ApplicationController
  before_action :reject_inactive_customer

  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    if @customer=Customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(customer_status: false)
    reset_session
    redirect_to new_customer_session_path
  end

  def reject_inactive_customer
    @customer = current_customer
    if @customer
      if @customer && !@customer.customer_status
        redirect_to new_customer_session_path
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:family_name,:first_name,:kana_family_name,:kana_first_name,:postal_code,:address,:phone_number,:customer_status)

  end

end
