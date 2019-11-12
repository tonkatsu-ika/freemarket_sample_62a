#README

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












