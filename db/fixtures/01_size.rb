require 'csv'

csv_path = 'db/fixtures/csv/sizes.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  Size.seed_once do |s|
    s.id = data[0]
    s.size = data[1]
  end
end
