# README

# ツール・ライブラリの名前
RELIEF



## 簡単な説明
保健所施設からの動物（犬、猫）の引き取り、引き取った動物のレビュー投稿を行えるアプリ


## 機能
- トップページに現在、里親を募集している動物、イベント情報、里親の投稿が一覧で表示されます。

- トップページ上段部分のコンテツは４項目有リます。エリアから探すでは、都道府県に属す施設の検索ができ、表示されたリンクをクリックすると施設に属する動物一覧を閲覧することが可能です。動物一覧では、犬か猫の条件に絞って検索することが可能で検索に別れた動物一覧を閲覧することが可能です。イベント情報、里親投稿一覧では、登録されたイベント、里親投稿の一覧を閲覧することが可能です。

- トップページの新規登録をクリックしユーザー情報を登録すると、応募フォーム機能、お気に入り機能を使用することができるようになります。

- トップページ、施設一覧の動物の写真をクリックすると選択した動物の詳細ページが表示され、下段部分の応募フォームから引き取りの応募が出来ます。

- 気になっている動物またいつも閲覧する施設はお気に入り機能があるため、後からマイページより見返すことが可能です。もしすでに里親が見つかっていた場合には詳細ページの応募フォームがCLOSEに切り替わります。

- 応募後にマイページのレビュー画面から、応募して引き取った動物のレビューを投稿することができ、投稿したものは誰でも閲覧できるトップページに表示されます。
 
 
## 開発環境
 
- Ruby 2.5.1
- Rails 5.2.4.2
- mysql 5.6.47
 
## 使い方
 
1. トップページ
- 未ログイン時ではトップページの閲覧のみ可能。詳細の閲覧、応募やお気に入り機能を使用したい場合には、右上のマイページ（ログイン中のためマイページ表示）になっておりますが、未ログイン時は新規作成に切り替わるのでそちらからアカウントを作成する手順になります。

![life](https://user-images.githubusercontent.com/60633085/80317720-6c087700-8840-11ea-9aab-76a4ad22f152.jpg)

![life2](https://user-images.githubusercontent.com/60633085/80317970-e71e5d00-8841-11ea-86a9-e009df286531.jpg)


2. 動物の詳細ページ
- ログインして、トップページに表示されている動物をクリックしたら、下のように動物の詳細画面が表示されます。
- 詳細の下画面にスライドすると応募画面が出てきます。

![life4](https://user-images.githubusercontent.com/60633085/80318206-65c7ca00-8843-11ea-885e-e09a54f97267.jpg)

<img width="1440" alt="life5" src="https://user-images.githubusercontent.com/60633085/80318266-f1d9f180-8843-11ea-8620-249cefaeb661.png">

2. 応募の手順
- 必要項目を入力して申し込むをクリックすると応募完了です

<img width="1440" alt="life6" src="https://user-images.githubusercontent.com/60633085/80318300-2e0d5200-8844-11ea-8bf2-f620de470338.png">

3. マイページで行えることは主に3つです。
- ユーザー情報の確認・編集
- チェックリストの閲覧
- レビュー投稿

<br>
<br>

- ユーザ情報

<img width="1438" alt="life7" src="https://user-images.githubusercontent.com/60633085/80318333-66ad2b80-8844-11ea-805f-84fb02cc9ae1.png">

- チェックリスト
※それぞれクリックすると詳細に移動します。

![life8](https://user-images.githubusercontent.com/60633085/80318362-a07e3200-8844-11ea-9120-c7387225d242.jpg)
<br>

- レビュー（記録）
※レビューに表示される動物は応募した動物のみとなります。投稿するをクリックすると入力フォーム画面に移動します。

<img width="1440" alt="life9" src="https://user-images.githubusercontent.com/60633085/80318419-f5ba4380-8844-11ea-8f4e-042b91fa44e7.png">





## movere DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|phone_number|integer|null: false
|city|string|null: false|
|city_adress|string|null: false|
|email|string|null: false|
|birthday|data|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
### Association
- has_many :animals
- has_many :facilities, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_facilities, through: :likes, source: :post
- has_many :posts, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :favorited_animals, through: :favorites, source: :animal
- has_many :animals, dependent: :destroy
- validates :name, presence: true, uniqueness: true

## facilitysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|prefecture|references|null: false, foreign_key: true|

### Association
- has_many :animals
- belongs_to :user, optional: true
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

## animalsテーブル
|Column|Type|Options|
|------|----|-------|
|species|string|null: false|
|name|string|null: false|
|type|string|null: false|
|gender|string|null: false|
|age|string|null: false|
|image1|string|null: false|
|image2|string
|image3|string
|buyer_id|references|foreign_key: { to_table: :users }|
|facility_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true
- belongs_to :facility
- has_many :reviews
- has_many :contacts
- has_many :favorites
- has_many :favorited_users, through: :favorites, source: :user

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|text|text|null: false|
|image|string|null: false|
|user_id|references|null: false, foreign_key: true|
|animal_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :animal
- validates :content, presence: true, unless: :image?
- mount_uploader :image, ImageUploader

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|


## contactsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|content|string|null: false|
|name|string|null: false|
|animal_id|references|null: false, foreign_key: true|

### Association
- belongs_to :animal

## eventsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|place|string|null: false|
|startmonth|string|null: false|
|startday|string|null: false|
|starttime|string|null: false|
|startminute|string|null: false|
|endmonth|string|
|endday|string|
|endtime|string|null: false|
|endminute|string|null: false|
|text|string|null: false|
|image|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|facility_id|references|null: false, foreign_key: true|
|userl_id|references|null: false, foreign_key: true|

### Association
- belongs_to :facility
- belongs_to :user
- validates_uniqueness_of :facility_id,scope: :user_id

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|animal_id|references|null: false, foreign_key: true|
|userl_id|references|null: false, foreign_key: true|

### Association
- belongs_to :animal
- belongs_to :user
- validates_uniqueness_of :animal_id,scope: :user_id

