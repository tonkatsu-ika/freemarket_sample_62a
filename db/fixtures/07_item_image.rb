require 'csv'
require 'fileutils'


Dir.chdir 'public/uploads/item_image/image_url/' 
FileUtils.rm(Dir.glob('*.*'))
Dir.chdir Rails.root

#image_dir = "public/uploads/item_image/image_url"

image_dir = "app/assets/images/item_images"
csv_path = "db/fixtures/csv/item_images.csv"
csv = CSV.read(csv_path)

csv.each do |data|
  ItemImage.seed_once do |s|
    s.id = data[0]

    #s.image_url = Rails.root.join("#{image_dir}/#{data[0]}/#{data[1]}").open

    s.image_url = Rails.root.join("#{image_dir}/#{data[1]}").open
    s.item_id = Item.find(data[2]).id
  end
end
