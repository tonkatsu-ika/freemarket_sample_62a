class ItemsController < ApplicationController
  
  # レイアウトはnewとcreateのとき変更する

  def index
  end

  def new
    render layout: 'basic'
    @item = Item.new
    10.times { @item.item_images.build }
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(parent_id: "#{params[:parent_id]}")
 end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(parent_id: "#{params[:child_id]}").children
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
    params.require(:item).permit(:name, :description, :price, :item_condition_id, :ship_fee_bearer_id, :prefecture_id, :days_before_ship_id, :delivery_method_id, :brand_id, :category_id, item_images_attributes:[:id, :image_url, :item_id]).merge(user_id: current_user.id)
  end
end
