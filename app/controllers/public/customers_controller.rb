class Public::CustomersController < ApplicationController

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
    @customer = Customer.find_by(email: params[:email])
  end

  def withdrawal
    @customer = Customer.find_by(email: params[:email])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:family_name,:first_name,:kana_family_name,:kana_first_name,:postal_code,:address,:phone_number,:customer_status)

  end

end
