class SearchController < ApplicationController

  def index

  end

  private
  # 商品検索用のbefore_action ransackサーチを使う場合はtrue(デフォはfalse)
  def use_ransack_search?
    true
  end
  
end
