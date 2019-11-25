require 'csv'

csv_path = 'db/fixtures/csv/brands.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  Brand.seed_once do |s|
    s.id = data[0]
    s.brand_name = data[1]
  end
end
