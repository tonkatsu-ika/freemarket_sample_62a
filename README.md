# README
[![Build Status](https://travis-ci.org/tonkatsu-ika/freemarket_sample_62a.svg?branch=push_branch)](https://travis-ci.org/tonkatsu-ika/freemarket_sample_62a)
[![Coverage Status](https://coveralls.io/repos/github/tonkatsu-ika/freemarket_sample_62a/badge.svg?branch=push_branch)](https://coveralls.io/github/tonkatsu-ika/freemarket_sample_62a?branch=push_branch)

# Versions
- Rails 5.2.3
- Ruby 2.5.1


# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|email|string|default: "", null: false, unique: true|
|encrypted_password|string|default: "", null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|profile_image|string||
|birthday|date|null: false|
|telephone|string|null: false|
|reset_password_token|string|unique: true|
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|profile|text|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :items, dependent: :destroy

- has_many :sold_to, class_name: "Transaction", foreign_key: "buyer_id", dependent: destroy
- has_many :buyers, through: bought_from
- has_many :bought_from, class_name: "Transaction", foreign_key: "seller_id", dependent: destroy
- has_many :sellers, through: sold_to

- has_one :address, dependent: destroy
- belongs_to_active_has :prefecutre
- accepts_nested_attributes_for :address
- has_one :credit_card, dependent: :destroy


## addresses table

|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture|string|null: false|
|address|string|null: false|
|building|string|null: false|
|user_id|bigint|foreign_key: true|


### Association
- belongs_to :user


## credit_cards table
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key: true|
|customer_id|string||
|card_id|string||
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
|user_id|bigint|foreign_key: true|
|item_id|bigint|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## comments table
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key: true|
|item_id|bigint|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## transactions table
購入者(buyer)と出品者(buyer)とはusersテーブルを自己結合で関連づける

|Column|Type|Options|
|------|----|-------|
|buyer_id|bigint|foreign_key: true|
|seller_id|bigint|foreign_key: true|
|item_id|bigint|foreign_key: true|
|grade_by_buyer_id|bigint|foreign_key: true|
|comment_by_buyer|string||
|grade_by_seller_id|bigint|foreign_key: true|
|comment_by_seller|string||
|transaction_status|integer|null: false|
|payment_method_id|bigint|foreign_key: true|

### Association
- belongs_to :grade
- belongs_to :buyer, class_name: "User", foreign_key: buyer_id
- belongs_to :seller, class_name: "User", foreign_key: seller_id
- belongs_to :item
- belongs_to :payment_method


## grades table

|Column|Type|Options|
|------|----|-------|
|grade|string|null: false|

### Association
- has_many :transactions


## payment_methods table

|Column|Type|Options|
|------|----|-------|
|method_name|string|null: false|

### Association
- has_many :transactions


## items table

|Field|Type|Options|
|---|:---:|---|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false, index: true|
|item_condition_id|bigint|foreign_key: true|
|ship_fee_bearer_id|bigint|foreign_key: true|
|prefecture_id|integer|
|days_before_ship_id|bigint|foreign_key: true|
|delivery_method_id|bigint|foreign_key: true|
|user_id|bigint|foreign_key: true|
|brand_id|bigint|foreign_key: true|
|category_id|bigint|foreign_key: true|
|size_id|bigint|foreign_key: true|



### Association
- belongs_to :item_condition
- belongs_to :ship_fee_bearer
- belongs_to :prefecture
- belongs_to :days_before_ship
- belongs_to :delivery_method

- belongs_to :user
- belongs_to :brand, optional: true
- belongs_to :category
- belongs_to :size, optional: true

- has_many :item_images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy


## item_images table

|Field|Type|Options|
|---|:---:|---|
|image_url|string|null: false|
|item_id|bigint|foreign_key: true|

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
|brand_name|string|null: false, index: true, unique: true|

### Association
- has_many :items


## categories table

|Field|Type|Options|
|---|:---:|---|
|category_name|string|null: false, index: true|
|parent_id|integer||


### Association
- has_many :sizes, through: :category_sizes
- has_many :category_sizes
- has_many :items


## category_hierarchies table
商品カテゴリーのツリー構造については、クエリのパフォーマンスが
「隣接リスト」より高い「閉包テーブル」(closure_tree)を採用。
本テーブルは「閉包テーブル」を採用したことにより自動作成されるテーブル。

|Field|Type|Options|
|---|:---:|---|
|ancestor_id|integer|null: false|
|descendant_id|integer|null: false, index: true|
|generations|integer|null: false|


### Association
none

### Addtional index
add_index :category_hierarchies, [:ancestor_id, :descendant_id,     :generations], unique: true, name: "category_anc_desc_idx"

## category_sizes table

|Field|Type|Options|
|---|:---:|---|
|category_id|bigint|foreign_key: true|
|size_id|bigint|foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size, dependent: :destroy


## sizes table

|Field|Type|Options|
|---|:---:|---|
|size|string|null: false, index: true|


### Association
- has_many :items
- has_many :categories, through: :category_sizes
- has_many :category_sizes
