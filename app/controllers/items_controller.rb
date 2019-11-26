class ItemsController < ApplicationController
  
  before_action :get_current_item, only: [:show, :edit, :update, :destroy]

  # レイアウトはnewとcreateのとき変更する

  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
    render layout: 'basic'
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}", parent_id: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_category_size
    category = Category.find(params[:grandchild_id])
    @sizes = []
    category.category_sizes.each do |size|
      @sizes << size.size
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      params[:item_images][:image_url].each do |a|
        @item.item_images.create!(image_url: a)
      end
    end
    render layout: 'basic'
  end

  def edit
    @current_item_category = Category.find(@item.category_id)
    @category_grandchildren = @current_item_category.self_and_siblings
    @category_children = @current_item_category.parent.self_and_siblings
    @category_parents = @current_item_category.parent.parent.self_and_siblings
    render layout: 'basic'
  end

  def update
    @item.update(item_params)
    redirect_to item_path
  end

  def destroy
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :item_condition_id, :ship_fee_bearer_id, :prefecture_id, :days_before_ship_id, :delivery_method_id, :brand_id, :category_id, :size_id, item_images_attributes: [:image_url, :item_id]).merge(user_id: 1) # current_user.id
  end

  # 現在のアイテムをインスタンス変数@itemに格納する
  def get_current_item
    @item = Item.find(params[:id])
  end
end
