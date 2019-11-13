# README

# Versions
- Rails 5.2.3
- Ruby 2.5.1


# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|profile_image|string|
|profile|text|null: false|
|mail_address|string|null: false|
|password|string|null: false|
|birthday|date|null: false|
|telephone|integer|null: false|

### Association
- has_many :comments
- has_many :likes
- has_many :items
- has_many :transaction
- has_many :buyers, class_name: User, foreign_key: "seller_id"
- has_many :sellers, class_name: User, foreign_key: "buyer_id"
- belongs_to :prefecutre
- has_one :credit_card


## addresses table

|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecuture|string|null: false|
|address|string|null: false|
|building|string|null: false|
|user|references|foreign_key: true|


### Association
- belongs_to :user


## credit_cards table
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|number|integer|null: false|
|expiration_month|date|null: false|
|expiration_year|year|null: false|
|security_code|integer|null: false|
|main_card_flag|boolean|null: false|

### Association
- belongs_to :user


## likes 
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## comments table
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## transactions table
購入者(buyer)と出品者(buyer)とはusersテーブルを自己結合で関連づける

|Column|Type|Options|
|------|----|-------|
|buyer_id|references|foreign_key: true|
|seller_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|grade_by_buyer|references|foreign_key: true|
|comment_by_buyer|string||
|grade_by_seller|references|foreign_key: true|
|comment_by_seller|string||
|transaction_status|integer|null: false|
|payment_method|references|foreign_key: true|

### Association
- belongs_to :grade
- belongs_to :buyer, class_name: User
- belongs_to :seller, class_name: User
- belongs_to :transaction_status
- belongs_to :payment_method
- has_many :items


## grades table

|Column|Type|Options|
|------|----|-------|
|grade|string|null: false, unique: true|

### Association
- has_many :transactions


## payment_methods table

|Column|Type|Options|
|------|----|-------|
|method_name|string|null: false, unique: true|

### Association
- has_many :transactions


## items table

|Field|Type|Options|
|---|:---:|---|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false, index: true|
|item_condition|references|foreign_key: true|
|ship_fee_bearer|references|foreign_key: true|
|days_before_ship|references|foreign_key: true|
|delivery_method|references|foreign_key: true|
|user|references|foreign_key: true|
|brand|references|foreign_key: true|
|category|references|foreign_key: true|


### Association
- has_one :item_condition
- has_one :ship_fee_bearer
- has_one :days_before_ship
- has_one :delivery_method

- belongs_to :user
- belongs_to :brand, optional: true
- belongs_to :category

- has_many :item_images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy


## item_images table

|Field|Type|Options|
|---|:---:|---|
|image_url|string|null: false|
|item|references|foreign_key: true|

### Association
- belongs_to :item


## item_conditions table

|Field|Type|Options|
|---|:---:|---|
|item_condition|string|null: false, unique: true|

### Association
- has_many :items


## ship_fee_bearers table

|Field|Type|Options|
|---|:---:|---|
|ship_fee_bearer|string|null: false, unique: true|

### Association
- has_many :items


## days_before_ship table

|Field|Type|Options|
|---|:---:|---|
|days_before_ship|string|null: false, unique: true|

### Association
- has_many :items


## delivery_methods table

|Field|Type|Options|
|---|:---:|---|
|delivery_method|string|null: false, unique: true|

### Association
- has_many :items


## brands table

|Field|Type|Options|
|---|:---:|---|
|brand_name|string|null: false, index: true, unique: true|

### Association
- has_many :items


## categories table

|Field|Type|Options|
|---|:---:|---|
|category_name|string|null: false, index: true|
|parent_id|integer|null: false|


### Association
- belongs_to :category_tree
- belongs_to :category_size, optional: true
- has_many :items


## categorie_tree table
商品カテゴリーのツリー構造については、クエリのパフォーマンスが
「隣接リスト」より高い「閉包テーブル」を採用。
本テーブルは「閉包テーブル」を採用したことにより必要となるテーブル。

|Field|Type|Options|
|---|:---:|---|
|ancestor_id|integer|null: false|
|descendant_id|integer|null: false|
|generations|integer|null: false|


### Association
- belongs_to :category_tree, optional: true
- has_many :items



## category_sizes table

|Field|Type|Options|
|---|:---:|---|
|category|references|foreign_key: true|
|size|reference|foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size, dependent: :destroy


## sizes table

|Field|Type|Options|
|---|:---:|---|
|size|string|null: false, index: true, unique: true|


### Association
- has_many :category_size
