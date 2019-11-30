FactoryBot.define do
  factory :address do
    post_code             {"1500041"}
    address               {"渋谷区神南１丁目１８−２"}
    building              {"フレーム"}
    user_id               {1}
    prefecture_id         {13}
    association :user
  end
end
