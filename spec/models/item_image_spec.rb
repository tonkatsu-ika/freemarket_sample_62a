require 'rails_helper'

RSpec.describe ItemImage, type: :model do

  context '商品出品できる' do

    it "画像が1枚だと出品できる"

    it "画像が10枚だと出品できる" 
    
  end

  context '商品出品できない' do

    it "画像がないと出品できない"

    it "画像が11枚だと出品できない" 
    
  end
end
