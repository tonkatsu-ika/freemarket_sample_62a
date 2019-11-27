require 'rails_helper'

RSpec.describe Item, type: :model do

  context '商品出品できる' do
    
    it "ブランド以外登録されてたら出品できる" do
      expect(FactoryBot.create(:item)).to be_valid
    end

    it "商品名が1文字だと出品できる" do
      expect(FactoryBot.build(:item, name: "あ")).to be_valid 
    end

    it "商品名が40文字だと出品できる" do
      expect(FactoryBot.build(:item, name: "あ"*40)).to be_valid 
    end

    it "商品説明が1文字だと出品できる" do
      expect(FactoryBot.build(:item, description: "あ")).to be_valid 
    end

    it "商品説明が1000文字だと出品できる" do
      expect(FactoryBot.build(:item, description: "あ"*1000)).to be_valid 
    end

    it "金額が300円だと出品できる" do
      expect(FactoryBot.build(:item, price: 300)).to be_valid 
    end

    it "金額が9999999円だと出品できる" do
      expect(FactoryBot.build(:item, price: 9999999)).to be_valid 
    end

  end

  context '商品出品できない' do

    # it '画像がないと出品できない' do
    #   item = FactoryBot.build(:item, item_images: [])
    #   item.valid?
    #   expect(item.errors[:item_images]).to include("を入力してください")
    # end

    it "商品名がないと出品できない" do
      item = FactoryBot.build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品名が41文字以上だと出品できない" do
      item = FactoryBot.build(:item, name: "あ"*41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "商品説明がないと出品できない" do
      item = FactoryBot.build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "商品説明が1001文字以上だと出品できない" do
      item = FactoryBot.build(:item, description: "あ"*1001)
      item.valid?
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end
    
    it "商品状態のidがないと出品できない" do
      item = FactoryBot.build(:item, item_condition_id: nil)
      item.valid?
      expect(item.errors[:item_condition_id]).to include("を入力してください")
    end

    it "配送料負担のidがないと出品できない" do
      item = FactoryBot.build(:item, ship_fee_bearer_id: nil)
      item.valid?
      expect(item.errors[:ship_fee_bearer_id]).to include("を入力してください")
    end

    it "都道府県のidがないと出品できない" do
      item = FactoryBot.build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "配送までの日数のidがないと出品できない" do
      item = FactoryBot.build(:item, days_before_ship_id: nil)
      item.valid?
      expect(item.errors[:days_before_ship_id]).to include("を入力してください")
    end

    it "カテゴリーidがないと出品できない" do
      item = FactoryBot.build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "金額が入力されていないと出品できない" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "金額が文字だと出品できない" do
      item = FactoryBot.build(:item, price: "aaa")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "金額が小数だと出品できない" do
      item = FactoryBot.build(:item, price: 3000.6)
      item.valid?
      expect(item.errors[:price]).to include("は整数で入力してください")
    end

    it "金額が299円以下だと出品できない" do
      item = FactoryBot.build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は299より大きい値にしてください")
    end

    it "金額が10000000円以上だと出品できない" do
      item = FactoryBot.build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は10000000より小さい値にしてください")
    end

  end

  context '商品が削除できる' do
    # it "id=1の商品を削除できる" do
    #   user = FactoryBot.build(:user, id: 1)
    #   login_user user
    #   item = FactoryBot.build(:item, id: 1, user_id: 1)
    #   expect(Item.where(id: 1).count).to eq 1
    #   item.destroy
    #   expect(Item.where(id: 1).count).to eq 0
    # end
  end

end
