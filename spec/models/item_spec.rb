require 'rails_helper'

RSpec.describe Item, type: :model do

  it "ブランド以外登録されてたら出品できる"

  it "画像がないと出品できない"

  it "画像が11枚だと出品できない"

  it "商品名がないと出品できない"

  it "商品名が41文字以上だと出品できない"

  it "商品説明がないと出品できない"

  it "商品説明が1001文字以上だと出品できない"

  it "商品状態のidがないと出品できない"

  it "配送料負担のidがないと出品できない"

  it "都道府県のidがないと出品できない"

  it "配送までの日数のidがないと出品できない"

  it "カテゴリーidがないと出品できない"

  it "金額が入力されていないと出品できない"

  it "金額が小数だと出品できない"

  it "金額が299円以下だと出品できない"

  it "金額が10000000円以上だと出品できない"

end
