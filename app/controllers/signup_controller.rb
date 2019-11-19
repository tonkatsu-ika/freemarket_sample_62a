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
    
    session[:address_attributes] = user_params[:address_attributes]
    session[:user_params].merge!(user_params)
    @user = User.new(session[:user_params])
    @user.build_address(user_params[:address_attributes])
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
