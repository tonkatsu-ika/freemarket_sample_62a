class ApplicationController < ActionController::Base
  before_action :get_brand_category_all
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  :layout_by_resource
  
  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :first_name, :last_name, :first_name_katakana, :last_name_katakana,:telephone])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  ## ログアウト後に遷移するpathを設定
  private
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def get_brand_category_all
    @brand_all = Brand.all
    @category_all = Category.roots
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
