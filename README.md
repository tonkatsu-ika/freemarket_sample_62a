# README

# Versions
- Rails 5.2.3
- Ruby 2.5.1


# DB設計

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

- has_many :item_images
- has_many :likes, dependent: destroy
- has_many :comments




