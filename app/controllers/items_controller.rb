class ItemsController < ApplicationController
  
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
    if @item.valid?
      if @item.save!
        params[:item_images][:image_url].each do |a|
          @item.item_images.create!(image_url: a)
        end
        redirect_to items_path, notice: '商品を出品しました'
      end
    else
      # バリデーション失敗時のアクション
      redirect_to action: 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id && item.destroy
      redirect_to items_path, notice: '出品した商品を削除しました'
    else
      flash.now[:alert] = '商品を削除できませんでした'
      render :index
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :item_condition_id, :ship_fee_bearer_id, :prefecture_id, :days_before_ship_id, :delivery_method_id, :brand_id, :category_id, :size_id, item_images_attributes: [:image_url, :item_id]).merge(user_id: 1) # current_user.id
  end
end
