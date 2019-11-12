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
