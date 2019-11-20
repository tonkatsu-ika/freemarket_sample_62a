require 'csv'

csv_path = 'db/fixtures/csv/category_sizes.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  CategorySize.seed_once do |s|
    s.id = data[0]
    s.category_id = data[1]
    s.size_id = data[2]
  end
end
