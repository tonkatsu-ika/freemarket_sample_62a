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
    @user.build_address
  end

  #支払い方法入力
  def payment
    @user = User.new
    @user.build_credit_card
  end
  
  #会員情報登録完了
  def done
    @user = User.new
  end
  
  private

  def user_params
    params.require(:user).permit(:name, address_attributes:[:id, :post_code, :prefecture, :address,:building])
  end

end
