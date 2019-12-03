require 'csv'
require 'faker'

csv_path = 'db/fixtures/csv/users.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  User.seed_once do |s|
    s.id = data[0]
    s.email = "test#{data[0]}@example.com"
    s.password = "password"
    s.last_name = Faker::Name.last_name
    s.first_name = Faker::Name.first_name
    s.last_name_kana = Faker::Name.last_name.tr("あ-ん", "ア-ン")
    s.first_name_kana = Faker::Name.first_name.tr("あ-ん", "ア-ン")
    s.nickname = data[1]
    s.profile_image = Faker::Avatar.image(size: "60x60", format: "jpg")
    s.birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    s.telephone = Faker::PhoneNumber.phone_number
    s.provider = ""
    s.uid = ""
    s.profile = data[2]
  end
end

