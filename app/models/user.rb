class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :items, dependent: :destroy
         has_many :transactions
         has_many :buyers, class_name: "User", foreign_key: "id"
         has_many :sellers, class_name: "User", foreign_key: "id"
         has_one :address, dependent: :destroy
         belongs_to_active_hash :prefecture
         accepts_nested_attributes_for :address

         has_one :credit_card, dependent: :destroy

end
