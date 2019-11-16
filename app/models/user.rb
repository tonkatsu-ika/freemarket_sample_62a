class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one :address, dependent: :destroy
         belongs_to_active_hash :prefecture
         belongs_to :user
         has_one :credit_card, dependent: :destroy
         accepts_nested_attributes_for :address

end
