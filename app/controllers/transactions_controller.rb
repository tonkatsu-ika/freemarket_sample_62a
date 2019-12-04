class TransactionsController < ApplicationController
  require 'payjp'
  layout 'users' ## とりあえずここにかいておく。

  before_action :authenticate_user!

  def show
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      redirect_to item_path(item), alert: 'あなたが出品した商品です。'
    else
      @item = Item.includes(:category, :user, :item_images).find(params[:id])
      @user = User.includes(:address).find(current_user.id)
      @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
      if @card != nil
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @card_information = customer.cards.retrieve(@card.card_id)
        @card_brand = @card_information.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.svg"
        when "JCB"
          @card_src = "jcb.gif"
        when "MasterCard"
          @card_src = "mastercard.svg"
        when "American Express"
          @card_src = "amex.gif"
        when "Diners Club"
          @card_src = "diners.gif"
        when "Discover"
          @card_src = "discover.gif"
        end
      else
        redirect_to item_path(item), alert: 'クレジットカードをマイページで登録してください。'
      end
    end
  
  end

  def create

  end

  def pay
    @item = Item.where(id: params[:format]) 
    session[:item] = params[:format]
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item[0].price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    tran = Item.where(id: @item[0].id)
    
    #Itemのtransaction_statusを購入済み（３）に変更
    tran.update(transaction_status:3)
    redirect_to action: 'done' #完了画面に移動
  end

  def done
    @item = Item.where(id: session[:item]) 
    session[:item] = nil
    @address = User.includes(:address).find(current_user.id)
    card = CreditCard.where(user_id: current_user.id).first
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "credit_card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "mastercard.svg"
      when "American Express"
        @card_src = "amex.gif"
      when "Diners Club"
        @card_src = "diners.gif"
      when "Discover"
        @card_src = "discover.gif"
      end
    end
  end

  private
  # 許可するキーを設定
  def transaction_params
    params.require(:transaction).permit(
      :id, :buyer_id, :seller_id, :item_id
    )
  end


end