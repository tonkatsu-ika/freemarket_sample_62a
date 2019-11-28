class SignupController < ApplicationController
  layout 'users'
  
  #会員情報入力
  def registlation
    @user = User.new
  end

  #電話番号入力
  def sms_confirmation
    session[:user_params] = user_params
    @user = User.new
  end

  #住所入力
  def address
    @user = User.new
    session[:telephone] = user_params[:telephone]
    @user.build_address
  end

  #支払い方法入力
  def payment
    binding.pry
    session[:address_attributes] = user_params[:address_attributes]
    session[:user_params].merge!(user_params)
    @user = User.new(session[:user_params])
    @user.build_address(user_params[:address_attributes])
    password_length = 10
    @user.password = Devise.friendly_token(password_length)
    def facebook
      callback_for(:facebook)
    end
  
    def google_oauth2
      callback_for(:google)
    end
  
  
    # private
   
    def callback_for(provider)
      provider = provider.to_s
      @user = User.find_oauth(request.env['omniauth.auth'])
      unless @user.uid
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        render template: "/users/sign_in" 
      else
        session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
        session[:uid]= session["devise.#{provider}_data"][:uid]
        session[:provider]= session["devise.#{provider}_data"][:provider]
        binding.pry
        # redirect_to registlation_signup_index_path(@user)
        render template: registlation_signup_index_path(@user)
      end
    end
    @user.uid = session[:uid]
    @user.provider = session[:provider]
    binding.pry
    if @user.save
      session[:id] = @user.id
      
    else
      redirect_to payment_signup_index_path
    end

    @card = CreditCard.new
    @user = User.new
    
  end
  
  #会員情報登録完了
  def done   
    @user = User.new
  end
  #リロードした際に新規登録画面の最初に戻す
  def show
    session[:user_params] = nil
    session[:address_attributes] = nil 
    session[:telephone] = nil
    session[:user_id] = nil
    flash[:danger] = '不正な処理が行われました'
    redirect_to action: 'registlation'
  end

  def auth
    @user = User.new
  end
  
  private
  # 許可するキーを設定
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana,
      :birthday,
      :telephone,
      address_attributes:[:id, :post_code, :prefecture_id, :address,:building]
    )

  end

end
