class SignupController < ApplicationController
  require "payjp"
  layout 'users_login'

  #会員情報入力
  def registlation
    
    @user = User.new
    
  end

  #電話番号入力
  def sms_confirmation
    user= User.where(email: user_params[:email] )
    
    if user.present?
      flash[:email] = '･入力されたメールアドレスはすでに登録されています'
      redirect_to action: 'registlation'
    end  
    
    # unless verify_recaptcha(ENV['RECAPTCHA_SECRET_KEY'])
    #   redirect_to action: registlation ,alert: 'ユーザ認証をしてください'
    # end
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
    
    session[:address_attributes] = user_params[:address_attributes]
    session[:user_params].merge!(user_params)

    @user = User.new(session[:user_params])
    @user.build_address(user_params[:address_attributes])
    binding.pry
    if @user.uid.present?    
      password_length = 10
      @user.password = Devise.friendly_token(password_length)
      @user.password_confirmation = @user.password
    end

    if @user.save
      session[:id] = @user.id
      
      if user_signed_in?
      #ユーザーログイン
        session[:user_id] = nil
      else  
        sign_in User.find(session[:id]) unless user_signed_in?   
      end
      sign_in User.find(session[:id]) unless user_signed_in?  
    else      
      redirect_to action: 'payment'
    end
    

    @card = CreditCard.new
    @user = User.new
    
  end
  
  #会員情報登録完了
  def done
    
    
  end

  def auth
    @user = User.new
  end
  #リロード時のページを指定
  def show
    session[:user_params] = nil
    session[:address_attributes] = nil 
    session[:telephone] = nil
    session[:user_id] = nil
    flash[:danger] = '不正な処理が行われました'
    redirect_to action: 'registlation'
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
      :uid,
      :provider,
      address_attributes:[:id, :post_code, :prefecture_id, :address,:building]
    )
  end

end
