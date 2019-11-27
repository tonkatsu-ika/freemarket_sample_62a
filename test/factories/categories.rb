FactoryBot.define do
  factory :category do
    category_name { "パンツ" }
    parent_id { 2 }
    after(:create) do |category|
      create_list(:size, 3, categories: [category])
    end
  end
end
