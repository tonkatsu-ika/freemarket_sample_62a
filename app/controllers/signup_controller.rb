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
    
  end

  #支払い方法入力
  def payment
    
  end
  
  #会員情報登録完了
  def done
    
  end
  

end
