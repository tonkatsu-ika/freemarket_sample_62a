class Item < ApplicationRecord
  has_one :item_condition
  has_one :ship_fee_bearer
  has_one :days_before_ship
  has_one :delivery_method
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to :size
  has_many :item_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
