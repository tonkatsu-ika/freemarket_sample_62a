class Transaction < ApplicationRecord
  belongs_to :grade_by_buyer, class_name: "Grade", foreign_key: :grade_by_buyer_id
  belongs_to :grade_by_seller, class_name: "Grade", foreign_key: :grade_by_seller_id
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  belongs_to :seller, class_name: "User", foreign_key: :seller_id
  belongs_to :item 
  belongs_to :payment_method
end
