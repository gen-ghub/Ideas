# 『Seedeas』


## 概要
「Seedeas」は業種に関わらず、業務展開の機会を提供するサービス。簡単に言えば、異業種のマッチングサービス。自分のスキル（種）と誰かのアイデアが合わさった時に新たな可能性が生まれる、そんなサービスです。

＊下記に変更（課題解決力が弱い為）
フードロスや昨今の台風や豪雨の被害を受けておられる農家さんを応援するアプリ。規格外品などB級品を告知したり、天災の被害で出荷出来なくなった農作物に関しては動物の餌へ。
また、台風被害対策で収穫時期を早め、サプリメント用や飲料に加工することも提案できます。




## URL
 [オリジナルアプリ](http://46.51.227.188)


## 使用技術
- HTTML
- SCSS
- Javascript
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 0.5.3



## インフラ構成図
￼





# 主要機能
## ログイン関連
- ログイン機能


## ユーザー関連
- 生産者登録機能
- 生産者削除機能 (登録者のみ）
- 生産者詳細表示機能
- 生産者プロフィール編集機能
- 生産者プロフィール画像アップロード機能


## 投稿関連投稿機能
- 投稿一覧表示機能
- 投稿詳細表示機能
- 投稿編集機能投稿
- 削除機能
- 投稿検索機能

# その他
- ページネーション機能
- いいね/いいね解除機能

# 追加をかんがえている機能
- 簡単ログイン可能
- レスポンシブ
- Flash機能
- cookiesによる永続ログイン
- 生産者一覧表示機能
- 生産者ーフォロー/フォロー解除機能
- フォローユーザー/フォロワー一覧表示機能
- フォローユーザーの投稿一覧表示
- いいねした投稿一覧表示機能
- 常時SSI化
- メッセージ非同期＋生産者とユーザーがやり取りできるように
- 通知機能
- 本人認証
- SNSログインorTwitterアカウントマイページに追加
- 生産者評価機能（5星）
- ユーザー専用のアカウント登録機能



# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| email              | string  | null: false                    |
| encrypted_password | string  | null: false                    |
| producers          | string  | null: false                    |
| crops              | string  | null: false                    |
| address_code       | string  |                                |
| address            | string  |                                |
| contact            | string  |                                |
| url                | string  |                                |
| profile            | text    |                                |

### Association
- has_many :ideas
- has_many :messages
- has_many :rooms, through: entries
- has_many :likes

## ideas テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| title           | string     | null: false                   |
| tag             | string     | null: false                   |
| text            | text       | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :room
- has_many :likes

## rooms テーブル

| Column | Type   | Options     |
| ------ | -------| ----------- |
| name   | string | null: false |


### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| idea    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :idea
