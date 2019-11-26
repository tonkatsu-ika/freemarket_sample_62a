require 'csv'
require 'faker'

csv_path = 'db/fixtures/csv/items.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  Item.seed_once do |s|
    s.id = data[0]
    s.name = data[1]
    s.description = Faker::Lorem.paragraphs
    s.price = data[3]
    s.item_condition_id = data[4]
    s.ship_fee_bearer_id = data[5]
    s.days_before_ship_id = data[6]
    s.delivery_method_id = data[7]
    s.user_id = data[8]
    s.brand_id = data[9]
    s.category_id = data[10]
    s.size_id = data[11]
  end
end

