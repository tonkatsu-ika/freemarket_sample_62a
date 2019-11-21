class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploaders :image_url, ImageUploader

  validates :image_url, presence: true
  validate :image_url_validation #image_urlが1〜10枚であること

  def image_url_validation
    image_validation = image_url
    image_validation.split(',')
    if image_validation.length < 1
      errors.add(:image_url, "画像を登録してください")
    end
    if image_validation.length >10
      errors.add(:image_url, "画像は10個までです")
    end
  end
end
