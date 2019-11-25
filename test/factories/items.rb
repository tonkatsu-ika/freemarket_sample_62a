FactoryBot.define do
  factory :item do
    name { "商品名" }
    description { "こちらの商品がオススメです" }
    item_condition_id { 1 }
    ship_fee_bearer_id { 1 }
    prefecture { 1 }
    days_before_ship_id { 1 }
    category_id { 35 }
    price { 300 }
    association :user
  end
end