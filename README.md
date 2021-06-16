# テーブル設計

## users テーブル

|    Column      | Type   | Options     |
| -------------  | ------ | ----------- |
| name           | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
|first_name      | string | null: false |
|last_name       | string | null: false |
|first_name_kana | string | null: false |
|last_name_kana  | string | null: false |
|birthday        | date   | null: false |

### Association

- has_many :items

## items テーブル

|    Column    | Type       | Options                        |
| ------------ | ---------- | -----------------------------^ |
| name         | string     | null: false                    |
| image        | text       | null: false                    |
| price        | string     | null: false                    |
|burden        | string     | null: false                    |
|state         | string     | null: false                    |
|category      | date       | null: false                    |
|estimated_day | string     | null: false                    |
|user          | references | null: false, foreign_key: true |

### Association

- belongs_to :orders

## orders テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| birthday | date   | null: false |

### Association

- belongs_to :from

## from テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------  |
| from    | date       |  null: date |                             |

### Association

- has_one :orders
