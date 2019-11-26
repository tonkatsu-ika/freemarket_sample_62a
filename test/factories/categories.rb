FactoryBot.define do
  factory :category do
    category_name { "パンツ" }
    parent_id { 2 }
    association :size
  end
end
