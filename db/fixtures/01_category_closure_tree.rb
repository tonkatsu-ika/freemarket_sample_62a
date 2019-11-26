require 'csv'
require 'closure_tree'

category_csv_path = "db/fixtures/csv/categories.csv"
category_csv = CSV.read(category_csv_path)

records = []

if Category.length == 0
  category_csv.each_with_index do |data, i|
    if data[2] == nil
      records << Category.create(category_name: data[1])
    else
      child = Category.create(category_name: data[1])
      records << child
      Category.find(data[2]).add_child child
    end
    p records[i]
  end
end