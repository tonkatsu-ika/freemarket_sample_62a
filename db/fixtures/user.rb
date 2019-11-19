require 'csv'
require 'faker'

csv_path = 'db/fixtures/csv/users.csv'
csv = CSV.read(csv_path)

csv.each do |data|
  User.seed_once do |s|
    s.id = data[0]
    s.last_name = 
  end
end

