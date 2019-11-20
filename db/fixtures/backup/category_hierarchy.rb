require 'csv'

csv_path = "db/fixtures/csv/category_hierarchies.csv"
csv = CSV.read(csv_path)

csv.each do |data|
  CategoryHierarhies.seed_once do |s|
    s.id = data[0]
    s.ancestor_id = data[1]
    s.descendant_id = data[2]
    s.generations = data[3]
  end
end
