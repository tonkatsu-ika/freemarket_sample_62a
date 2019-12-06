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
  has_many :like_items, through: :likes, source: :item
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
  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, unless: :uid?, on: :create

  ##sns auth
 

   def self.find_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        nickname: auth.info.name,
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        password: Devise.friendly_token[0.20]
      )
  end
  user
  end

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

    def   valid_email(email)
       user = User.where(email: email)
       if email.present?
        　　= '入力されたメールアドレスはすでに登録されています'
       end
       
    end


    # protected
    # #パスワードなしでユーザー情報を更新する
    # def self.update_resource(resource, params)
    #   resource.update_without_current_password(params)
    # end


end
