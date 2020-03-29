# README

## movere DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|phone number|integer|limit: 11
|city|string|null: false|
|city_adress|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :rewards
- has_many :qacomments
- has_many :reviews

## facilitysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|area|text|null: false|

### Association
- has_many :animals
- has_many :qacomments

## animalsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|type|string|null: false|
|gender|string|null: false|
|age|string|null: false|
|image1|string|null: false|
|image2|string
|image3|string
|buyer_id|references|foreign_key: { to_table: :users }|
|facility_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :facility

## qacommentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|animal_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :animal

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user