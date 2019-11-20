require 'csv'

csv_path = 'db/fixtures/csv/categories.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  Category.seed_once do |s|
    s.id = data[0]
    s.category_name = data[1]
    s.parent_id = data[2]
  end
end
