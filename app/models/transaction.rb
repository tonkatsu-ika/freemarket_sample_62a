class Transaction < ApplicationRecord
  belongs_to :grade
  belongs_to :buyer_id, class_name: User
  belongs_to :seller_id, class_name: User
  belongs_to :item_id # READMEはhas_many :items担っていたが？
  belongs_to :payment_method
end
