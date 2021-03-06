require 'faker'

5.times do |i|
  Address.seed_once do |s|
    s.id = i + 1
    s.post_code = Faker::Address.zip_code
    s.address = "#{Faker::Address.city} #{Faker::Address.street_name} #{Faker::Address.building_number}"
    s.building = "#{Faker::Name.last_name}ビル"
    s.user_id = i + 1
    s.prefecture_id = Prefecture.find(i+1).name
  end
end
