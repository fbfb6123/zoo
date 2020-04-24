# README

# ツール・ライブラリの名前
RELIEF



## 簡単な説明
保健所施設からの動物（犬、猫）の引き取りをアプリ内で行えるもの。

 
## 機能
- トップページに現在、里親を募集している動物が一覧で表示されます。
- トップページの上段部分からエリア検索ができ、施設に属する動物を検索することが可能。また、動物一覧からは犬猫を条件に絞って検索することが可能です。

- 動物の写真をクリックすると詳細のページが表示され、下段部分の応募フォームから応募が出来ます。

- 気になっている動物はお気に入り機能があるため、後からマイページより見返すことが可能です。もしすでに里親が見つかっていた場合には詳細ページの応募フォームがCLOSEに切り替わります。

- 応募後にマイページのレビュー画面から、応募して引き取った動物のレビューを投稿することができ、投稿したものは誰でも閲覧できるトップページに表示されます。
 
 
## 開発環境
 
- Ruby 2.5.1
- Rails 5.2.4.2
- mysql 5.6.47
 
## 使い方
 
1. トップページ
- 未ログインではトップページの閲覧のみ可能。詳細の閲覧、応募やお気に入り機能を使用したい場合には、右上のマイページ表示（ログイン中のため）になっておりますが、未ログイン時は新規作成に切り替わるのでそちらからアカウントを作成する手順になります。
![bc5ccf6c0978f039cb43116ff9862b08](https://user-images.githubusercontent.com/60612010/80186530-14ec8180-8649-11ea-9d43-fd750f9950ab.jpg)
![RELIEF](https://user-images.githubusercontent.com/60612010/80186909-bbd11d80-8649-11ea-8364-094729d4e92e.jpg)


2. 動物の詳細ページ
- アカウントを取得して、トップページに表示されている動物をクリックしたら、下のように動物の詳細画面が表示されます。
- 詳細の下画面にスライドすると応募画面が出てきます。
<img width="1437" alt="ba3a458eccd25960b3070677d200be6a" src="https://user-images.githubusercontent.com/60612010/80188319-f340c980-864b-11ea-9db8-172d53ac8478.png">
<img width="1437" alt="dc300b1c28b7aafd2db4f7040e18c64c" src="https://user-images.githubusercontent.com/60612010/80188664-76621f80-864c-11ea-8799-3010a04b4ef7.png">

2. 応募の手順
- 必要項目を入力して申し込むをクリックすると応募完了です
<img width="1440" alt="79fe8294fe4d986123063e694e666081" src="https://user-images.githubusercontent.com/60612010/80188989-ebcdf000-864c-11ea-9c40-ded05f01bf36.png">

3. マイページで行えることは主に3つです。
- ユーザー情報の確認・編集
- チェックリストの閲覧
- レビュー投稿

<br>
<br>

- ユーザ情報
<img width="1438" alt="3a8c2a795d74f96e0308ad879596e535" src="https://user-images.githubusercontent.com/60612010/80190205-d9ed4c80-864e-11ea-97cb-d2e1a6cf8b68.png">

- チェックリスト
※それぞれクリックすると詳細に移動します。
![8a898d1befef6c7509a88455f4e5f8ea](https://user-images.githubusercontent.com/60612010/80191545-d22ea780-8650-11ea-9565-d8fe6157f060.jpg)
<br>

- レビュー（記録）
※レビューに投稿に表示される動物は応募した動物のみとなります。投稿するをクリックすると入力フォーム画面に移動します。
<img width="1439" alt="1d14c6cb728e720f951ea532213b6f1e" src="https://user-images.githubusercontent.com/60612010/80189651-f76de680-864d-11ea-9c57-8bd17b61340d.png">



 
## その他
 




## movere DB設計

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
- has_many :facilitys
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

## eventsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|null: false|
|user_id|integer|null: false, foreign_key: true|

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## test
maypage

## 開発環境
