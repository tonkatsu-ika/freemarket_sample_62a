require 'csv'

image_dir = "app/assets/images/item_images/"
csv_path = "db/fixtures/csv/item_images.csv"
csv = CSV.read(csv_path)

csv.each do |data|
  ItemImage.seed_once do |s|
    s.id = data[0]
    s.image_url = "#{image_dir}#{data[1]}"
    s.item_id = Item.find(data[2]).id
  end
end
