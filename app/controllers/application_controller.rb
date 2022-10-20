class ApplicationController < ActionController::Base
  before_action:configure_permitted_parameter,if: :devise_controller?

  protected

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up , keys:[:family_name,:first_name,:kana_family_name,:kana_first_name,:postal_code,:address,:phone_number,:customer_status])
  end

end
