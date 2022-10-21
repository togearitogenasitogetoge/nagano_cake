# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :reject_inactive_customer,only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #def reject_inactive_customer
    #@customer = Customer.find_by(email: params[:customer][:email])
    #if @customer
      #if @customer.vaild_password?(params[:customer][:password]) && !@customer.customer_status
        #redirect_to new_customer_session_path
      #end
    #end
  #end

  protected

  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end



end
