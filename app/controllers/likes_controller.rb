class LikesController < ApplicationController
  before_action :set_variables

  def create
    if user_signed_in?
      @like = Like.create(user_id: current_user.id, item_id: @item.id)
    end
  end

  def destroy
    @like = current_user.likes.find_by(item_id: @item.id)
    @like.destroy
  end

  private

  def set_variables
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
  end

end
