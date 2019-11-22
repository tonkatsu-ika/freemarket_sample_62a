class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  ## association
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :items, dependent: :destroy

  has_many :sold_to, class_name: "Transaction", foreign_key: "buyer_id", dependent: :destroy
  has_many :buyers, through: :bought_from

  has_many :bought_from, class_name: "Transaction", foreign_key: "seller_id", dependent: :destroy
  has_many :sellers, through: :sold_to

  has_one :address, dependent: :destroy
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :address
  has_one :credit_card, dependent: :destroy

  has_many :sns_credentials, dependent: :destroy
  
  ## validation
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
  validates :password, presence: true, unless: :uid?

  ##sns auth
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

end
