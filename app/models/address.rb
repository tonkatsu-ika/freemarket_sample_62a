class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #asociation
  belongs_to :user

  belongs_to :prefecture

  #validation
  validates :post_code, presence: true
  validates :address, presence: true
  validates :prefecture_id, presence: true
  validates :user_id, presence: true


end
