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
    

    # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #   if params['payjp-token'].blank?
    #     redirect_to action: "new"
    #   else
    #     customer = Payjp::Customer.create(
    #     # description: '登録テスト', #なくてもOK
    #     # email: current_user.email, #なくてもOK
    #     card: params['payjp-token'],
    #     # metadata: {user_id: current_user.id}
    #     ) #念の為metadataにuser_idを入れましたがなくてもOK
    #     binding.pry
    #     @card = CreditCard.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
        
    #     if @card.save
    #       redirect_to done_signup_index_path
    #     else
    #       redirect_to action: "payment"
    #     end
    #   end
    
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
      address_attributes:[:id, :post_code, :prefecture, :address,:building]
    )
  end

end
