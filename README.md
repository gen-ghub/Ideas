# 『Seedeas』


## 概要
「Seedeas」
フードロスや昨今の台風や豪雨の被害を受けておられる農家さんを応援するアプリ。規格外品などB級品を告知したり、天災の被害時にボランティアの募集もしております。
また、台風被害対策で収穫時期を早め、サプリメント用や飲料に加工することも提案できます。

![概要](https://user-images.githubusercontent.com/69387339/101149687-a2259900-3662-11eb-8baf-62a2118dd7d8.gif)

</br>
</br>

## URL
 [オリジナルアプリ](http://46.51.227.188)


## 使用技術
- HTTML
- SCSS
- Javascript
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 0.5.3

</br>
</br>

## インフラ構成図
￼￼<img width="859" alt="インフラ構成図" src="https://user-images.githubusercontent.com/69387339/101133193-9aa6c580-364b-11eb-81d9-f9dc675fec7d.png">




</br>

# 主要機能
</br>

## ログイン関連
- ログイン機能

</br>
</br>

## ユーザー関連
- 生産者登録機能
- 生産者削除機能 (登録者のみ）
- 生産者詳細表示機能
- 生産者プロフィール編集機能
- 生産者プロフィール画像アップロード機能

</br>
</br>

## 投稿関連投稿機能
- 投稿一覧表示機能
- 投稿詳細表示機能
- 投稿編集機能投稿
- 削除機能
- 投稿検索機能

</br>
</br>

# その他
- ページネーション機能
- いいね/いいね解除機能

</br>
</br>

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
- 通知機能
- 本人認証
- SNSログインorTwitterアカウントマイページに追加
- 生産者評価機能（5星）


</br>
</br>
</br>

# アプリの使用方法

## 投稿
画面右上の投稿するボタンを押して、投稿画面に移動。
タイトル、写真を選択、タグを選択、メッセージを入力をします。
メッセージ下の投稿するボタンを押せば、投稿が出来ます。

トップ画面下部に最新投稿が確認できます！

![投稿](https://user-images.githubusercontent.com/69387339/101147858-3fcb9900-3660-11eb-9257-7ad09deb82cb.gif)

</br>
</br>
</br>


# アプリケーション開発の背景
幼い時に、台風でも落ちなかったリンゴを受験生向けに販売しているニュースを見たことがありました。農家さんも助かるし、受験生は験を担ぐことができるので、双方にメリットがある素晴らしいなと思っておりました。さらに、大雨が降ることも最近では多くなり農家さんへの被害が大きくなっていると思い、少しでも、助けになればと思いこのアプリを作成しました。



</br>
</br>
</br>

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

</br>

### Association
- has_many :ideas
- has_many :messages
- has_many :rooms, through: entries
- has_many :likes

</br>

## ideas テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| title           | string     | null: false                   |
| tag             | string     | null: false                   |
| text            | text       | null: false                   |
| user            | references | null: false, foreign_key: true|

</br>

### Association
- belongs_to :user
- has_one :room
- has_many :likes

</br>

## rooms テーブル

| Column | Type   | Options     |
| ------ | -------| ----------- |
| name   | string | null: false |

</br>

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

</br>

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

</br>

### Association

- belongs_to :room
- belongs_to :user

</br>

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

</br>

### Association

- belongs_to :room
- belongs_to :user

</br>

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| idea    | references | null: false, foreign_key: true |

</br>

### Association

- belongs_to :user
- belongs_to :idea
