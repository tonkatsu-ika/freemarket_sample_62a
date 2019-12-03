class CreditCardController < ApplicationController
    require "payjp"
    layout 'users'
    def new
      card = CreditCard.new
      # redirect_to action: "show" if card.exists?
    end
  
    def pay #payjpとCardのデータベース作成を実施します。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if params['payjp-token'].blank?
        redirect_to action: "new"
      else
        customer = Payjp::Customer.create(
        # description: '登録テスト', #なくてもOK
        # email: current_user.email, #なくてもOK
        card: params['payjp-token'],
        # metadata: {user_id: current_user.id}
        ) #念の為metadataにuser_idを入れましたがなくてもOK
        
        @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        
        if @card.save
          
          redirect_to done_signup_index_path
        else
          redirect_to root_path
        end
      end
    end
  
    def delete #PayjpとCardデータベースを削除します
      card = CreditCard.where(user_id: current_user.id).first
      if card.blank?
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        customer.delete
        card.delete
      end
        redirect_to action: "new"
    end
  
    # def show #Cardのデータpayjpに送り情報を取り出します
    #   card = CreditCard.where(user_id: current_user.id).first
    #   if card.blank?
    #     redirect_to action: "new" 
    #   else
    #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #     customer = Payjp::Customer.retrieve(card.customer_id)
    #     @default_card_information = customer.cards.retrieve(card.card_id)
    #   end
    # end

    private
  # 許可するキーを設定
  def user_params
    params.require(:credit_card).permit()
  end
  
end
