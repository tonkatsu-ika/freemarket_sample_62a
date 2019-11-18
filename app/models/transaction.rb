class Transaction < ApplicationRecord
  belongs_to :grade
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  belongs_to :seller, class_name: "User", foreign_key: :seller_id
  belongs_to :item_id # READMEはhas_many :items担っていたが？
  belongs_to :payment_method
end
