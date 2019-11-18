class SignupController < ApplicationController
  layout 'users'
  
  #会員情報入力
  def registlation
    @user = User.new
  end

  #電話番号入力
  def sms_confirmation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new
    
  end

  #住所入力
  def address
    @user = User.new
    @user.build_address
  end

  #支払い方法入力
  def payment
    session[:telephone] = user_params[:telephone]
    session[:post_code] = user_params[:address_attributes][:post_code] 
    session[:prefecture] = user_params[:address_attributes][:prefecture]
    session[:address] = user_params[:address_attributes][:address]
    session[:building] = user_params[:address_attributes][:building]
    @user = User.new(nickname: session[:nickname],
                      email: session[:email],
                      password: session[:password],
                      last_name: session[:last_name],
                      first_name: session[:first_name],
                      last_name_kana: session[:last_name_kana],  
                      first_name_kana: session[:first_name_kana],
                      birthday: session[:birthday]
                      # post_code: session[:post_code],
                      # prefecture: session[:prefecture],
                      # address: session[:address],
                      # building: session[:building],
                      # telephone: session[:telephone],
    )
    
    @user.save
    binding.pry
    @user.build_credit_card
    binding.pry
  end
  
  #会員情報登録完了
  def done
    @user = User.new
  end
  
  
  private
  # 許可するキーを設定します
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
