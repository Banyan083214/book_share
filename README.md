# アプリケーション名
Book share

# アプリケーション概要
本の感想を共有

# URL
https://book-share-qqy7.onrender.com


# テスト用アカウント
・Basic認証パスワード : 0324

・Basic認証ID : tajima


# 利用方法


### 本の感想投稿
1,トップベージ（一覧ページ）のヘッダーからユーザー新規登録を行う

2,投稿ボタンから、本の内容（タイトル、あらすじ、ジャンル、著者、出版日、画像、感想）


### コメントで共感する
1,一覧ページから本の投稿をクリックして、投稿者の感想などを確認する。

2,共感したいと思ったらコメントやユーザーのフォロー・投稿のお気に入りなどを行う

# アプリケーションを作成した背景
私は読書後に本の感想を共有、共感することがとても好きだが、流行していない本では「周りの反応がない」と課題を感じていた。

その課題を解決するためには「本の感想の共有、共感にだけ特化した場がない」ということが真因ではないかと仮説を立てた。

同様の問題を抱えている方も多いと推測し、真意を解決するために、本の感想を共有しユーザー同士のコミニケーションを促進できるSNSアプリケーションを開発することにした。

# 洗い出した要件
<a href="https://docs.google.com/spreadsheets/d/1FbV8pHH0z4491lqpP2FvGkiG9wV0pFibJCVUxz0VZ7w/edit#gid=982722306">要件定義シート</a>
# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
現在、本の感想の投稿機能を実装中。

今後はコメント機能やフォロー機能を実装予定

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/2753fcf5e3f8523c250bab6812c81800.png)](https://gyazo.com/2753fcf5e3f8523c250bab6812c81800)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/bad799f8c2cb61579e4cb461f4cdafe5.png)](https://gyazo.com/bad799f8c2cb61579e4cb461f4cdafe5)

# 開発環境
・フロントエンド

・バックエンド

・テスト

・テキストエディタ


# ローカルでの動作方法

# 工夫したポイント



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
