class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy       
  belongs_to_active_hash :prefecture
  has_one :credit_card, dependent: :destroy   
  accepts_nested_attributes_for :address    
  validates :telephone, numericality: { allow_blank: true }
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :items, dependent: :destroy

         has_many :sold_to, class_name: "Transaction", foreign_key: "buyer_id", dependent: :destroy
         has_many :buyers, through: :bought_from

         has_many :bought_from, class_name: "Transaction", foreign_key: "seller_id"
         has_many :sellers, through: :sold_to

         has_one :address, dependent: :destroy
         belongs_to_active_hash :prefecture
         accepts_nested_attributes_for :address

         has_one :credit_card, dependent: :destroy


end
