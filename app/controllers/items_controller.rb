class ItemsController < ApplicationController
  
  # レイアウトはnewとcreateのとき変更する

  def index
    #ひとまず固定で以下アイテムの取得をする
    #レディース新着のアイテム取得
      @ladies = Item.where(category_id: 174).order("created_at DESC").includes(:item_images)
      
      binding.pry
      # @ladies = Item.includes(:item_images).where(category_id: 174).order("created_at DESC")
      # binding.pry
      # @ladies = Item.where(category_id: 174).includes(:item_images).order("created_at DESC")
      # binding.pry
      # @ladies = ladies.item_images.image_url
      
    #メンズ新着アイテムの取得
      @mens = Item.where(category_id: 2).order("created_at DESC")
    #家電・スマホ・カメラ新着アイテムの取得
      @appliances = Item.where(category_id: 8).order("created_at DESC")
    #おもちゃ・ホビー・グッズ新着アイテムの取得
      @hobbies = Item.where(category_id: 6).order("created_at DESC")
  #人気のブランド取得
    #シャネル新着アイテムの取得
      @chanel = Item.where(brand_id: 1).order("created_at DESC")
    #ルイヴィトン新着アイテムの取得
      @louis = Item.where(brand_id: 3).order("created_at DESC")
    #シュプリーム新着アイテムの取得
      @supreme = Item.where(brand_id: 4).order("created_at DESC")
    #ナイキ新着アイテムの取得
      @nike = Item.where(brand_id: 2).order("created_at DESC")
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
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :item_condition_id, :ship_fee_bearer_id, :prefecture_id, :days_before_ship_id, :delivery_method_id, :brand_id, :category_id, :size_id, item_images_attributes: [:image_url, :item_id]).merge(user_id: 1) # current_user.id
  end
end
