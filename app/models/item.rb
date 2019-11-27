class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :item_condition
  has_one :ship_fee_bearer
  belongs_to_active_hash :prefecture
  has_one :days_before_ship
  has_one :delivery_method
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to :size, optional: true
  has_many :item_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, presence: true
  validates :name, length: { maximum: 40 }
  # validates :item_images, presence: true
  # validate :image_validation
  validates :description, presence: true
  validates :description, length: { maximum: 1000 }
  validates :item_condition_id, presence: true
  validates :ship_fee_bearer_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_before_ship_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000} # 値段が300円以上9,999,999円以下であること

  def image_validation
    image_validation = item_images
    image_validation.split(',')
    if image_validation.length < 1
      errors.add(:image_url, "画像を登録してください")
    end
    if image_validation.length >10
      errors.add(:image_url, "画像は10個までです")
    end
  end

end
