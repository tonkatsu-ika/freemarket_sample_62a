class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :user
  belongs_to :prefecture
end
