# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| email              | string  | null: false                    |
| encrypted_password | string  | null: false                    |
| skill              | string  |                                |
| position           | string  |                                |
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
