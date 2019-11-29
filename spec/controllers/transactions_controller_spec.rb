require 'rails_helper'

describe TransactionsController do

  describe "GET #done" do

    it "doneアクション後、購入完了画面へ移動する" do
      get :done
      expect(response).to render_template :done
    end
  end

end