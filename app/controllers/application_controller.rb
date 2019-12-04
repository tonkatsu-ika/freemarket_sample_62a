class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  :layout_by_resource
  
  before_action :ransack_search, if: :use_ransack_search?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :first_name, :last_name, :first_name_katakana, :last_name_katakana,:telephone])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def layout_by_resource
    if devise_controller?
      "user"
    else
      "application"
    end
  end

  # 商品検索(items, search, mypageのみ適用)
  def ransack_search
    @item = Item.new
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  private

  ## ログアウト後に遷移するpathを設定  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # 商品検索用のbefore_action ransackサーチを使う場合はtrue(デフォはfalse)
  def use_ransack_search?
    false
  end

end
