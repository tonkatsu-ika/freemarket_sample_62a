class SignupController < ApplicationController
  layout 'users'
  
  #会員情報入力
  def registlation
    @user = User.new
  end

  #電話番号入力
  def sms_confirmation
    @user = User.new
  end

  #住所入力
  def address
    @user = User.new
    @address = @user.address
  end

  #支払い方法入力
  def payment
    @user = User.new
  end
  
  #会員情報登録完了
  def done
    @user = User.new
  end
  

end
