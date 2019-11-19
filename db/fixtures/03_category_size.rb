require 'csv'

csv_path = 'db/fixtures/csv/category_sizes.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  CategorySize.seed_once do |s|
    s.id = data[0]
    s.category = data[1]
    s.size = data[2]
  end
end
