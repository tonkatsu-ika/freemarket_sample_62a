class MypageController < ApplicationController
  require "payjp"

  before_action :authenticate_user!

  def index
  end



  def update
    user=User.find(current_user.id)
    user.update(nickname:params[:mypage][:nickname],profile: params[:mypage][:profile])
    redirect_to root_path,notice: 'プロフィールが変更されました'
  end

  def profile
  end

  def card
    @card = CreditCard.new
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
    if @card[:user_id] != nil
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
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if params['payjp-token'].blank?
        redirect_to action: "card"
      else
        customer = Payjp::Customer.create(
        # description: '登録テスト', #なくてもOK
        # email: current_user.email, #なくてもOK
        card: params['payjp-token'],
        # metadata: {user_id: current_user.id}
        ) #念の為metadataにuser_idを入れましたがなくてもOK
        
        @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        
        if @card.save
          
          redirect_to card_mypage_index_path
        else
          redirect_to action: "card"
        end
      end
  end


  def listing
    @lists  = Item.where(user_id: current_user.id).includes(:item_images)
  end
  
  def like

  end

  def identification
  end

  def logout
  end
end
