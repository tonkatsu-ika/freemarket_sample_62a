class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  :layout_by_resource
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :first_name, :last_name, :first_name_katakana, :last_name_katakana,:telephone])
  end

  

  protected

  def layout_by_resource
    if devise_controller?
      "user"
    else
      "application"
    end
  end
end
