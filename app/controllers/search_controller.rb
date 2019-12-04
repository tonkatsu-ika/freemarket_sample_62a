class SearchController < ApplicationController

  def index
    @item = Item.new
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  private

end
