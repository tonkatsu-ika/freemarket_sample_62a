# README

# Versions
- Rails 5.2.3
- Ruby 2.5.1


# DB設計

## userテーブル

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
|post_code|integer|null: false|
|prefecuture_id|reference|null: false,index: true, foreign_key: true|
|address|string|null: false|
|building|string|null: false|

### Association
- has_many :comments
- has_many :likes
- has_many :items
- has_many :transaction
- belongs_to :prefecutre
- belongs_to :credit_info


## prefectures table
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false, unique: true, index: true|

### Association
- has_many :users


## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false,foreign_key: true|
|number|integer|null: false|
|expired_date_month|date|null: false|
|expired_date_year|year|null: false|
|security_code|integer|null: false|
|main_card_flag|boolean|

### Association
- belongs_to :user

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## commentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|buy_user_id|references|null: false, foreign_key: true|
|sell_user_id|references|null: false, foreign_key: true|
|grade_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|to_buy_user_grade|references|null: false, foreign_key: true|
|to_buy_user_comment|string|
|to_sell_user_grade|references|null: false, foreign_key: true|
|to_sell_user_comment|string|
|item_status|references|null: false, foreign_key: true|
|payment|references|null: false, foreign_key: true|

### Association
- belongs_to :grade
- belongs_to :buy_user, class_name: User
- belongs_to :sell_user, class_name: User
- belongs_to :status
- belongs_to :payment
- has_many :items

## gradesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :transactions

## statusテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :transactions

## paymentsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

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

- has_many :item_images, dependent: destroy
- has_many :likes, dependent: destroy
- has_many :comments, dependent: destroy


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
|item_condition|string|null: false|

### Association
- has_many :items


## ship_fee_bearers table

|Field|Type|Options|
|---|:---:|---|
|ship_fee_bearer|string|null: false|

### Association
- has_many :items


## days_before_ship table

|Field|Type|Options|
|---|:---:|---|
|days_before_ship|string|null: false|

### Association
- has_many :items


## delivery_methods table

|Field|Type|Options|
|---|:---:|---|
|delivery_method|string|null: false|

### Association
- has_many :items


## brands table

|Field|Type|Options|
|---|:---:|---|
|brand_name|string|null: false, index: true|

### Association
- has_many :items


## categories table

|Field|Type|Options|
|---|:---:|---|
|category_name|string|null: false, index: true|
|parent_id|integer|null: false|


### Association
- belongs_to :category_tree
- has_many :items


## category_sizes table

|Field|Type|Options|
|---|:---:|---|
|category|references|foreign_key: true|
|size|reference|foreign_key: true|


### Association
- belongs_to :category
- belongs_to :size


## sizes table

|Field|Type|Options|
|---|:---:|---|
|size|string|null: false, index: true|


### Association
- has_many :category_size


