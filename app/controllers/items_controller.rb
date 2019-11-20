class ItemsController < ApplicationController
  
  # レイアウトはnewとcreateのとき変更する

  def index
  end

  def new
    render layout: 'basic'
    @item = Item.new
  end

  def create
    render layout: 'basic'
    @item = Item.create(item_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :item_condition_id, :ship_fee_bearer_id, :prefecture_id, :days_before_ship_id, :delivery_method_id, :brand_id, :category_id, item_image_attributes:[:id, {image_url: []}, :item_id]).merge(user_id: current_user.id)
  end
end
