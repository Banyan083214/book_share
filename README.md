# アプリケーション名
book share

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |




### Association

- has_many :favorites
- has_many :posts
- has_many :comments
- has_many :follows



##  posts テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| title              | string      | null: false |
| synopsis           | text        |             |
| image              | string      |             |
| genre_id           | integer     | null: false |
| author             | string      | null: false |
| publication_date   | date        |             |
| text               | text        | null: false |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_many :comments



## favorites テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| user               | references  | null: false, foreign_key: true |
| post               | references  | null: false, foreign_key: true |




### Association

- belongs_to :user
- belongs_to :post


## comments テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| text               | text        | null: false |
| user               | references  | null: false, foreign_key: true |
| post               | references  | null: false, foreign_key: true |




### Association

- belongs_to :user
- belongs_to :post



## followers テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| follower_id        | references  | null: false, foreign_key: true |
| followee_id        | references  | null: false, foreign_key: true |




### Association

- belongs_to :user
