class Item < ApplicationRecord
  has_one :item_condition
  has_one :ship_fee_bearer
  has_one :days_before_ship
  has_one :delivery_method
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  has_many :item_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :item_images

  validates :name, presence: true
  validates :name, length: { minimum: 1, maximum: 40 }
  validates :description, presence: true
  validates :description, length: { minimum: 1, maximum: 1000 }
  validates :item_condition_id, presence: true
  validates :ship_fee_bearer_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_before_ship_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000} # 値段が300円以上9,999,999円以下であること

end
