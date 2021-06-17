# テーブル設計

## users テーブル

|    Column          | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items

## items テーブル

|    Column       | Type       | Options                        |
| --------------- | ---------- | -----------------------------^ |
| seller_name     | string     | null:                          |
| price           | integer    | null:                          |
| burden_id       | string     | null: false, foreign_key: true |
| state_id        | string     | null: false, foreign_key: true |
| category_id     | date       | null: false, foreign_key: true |
| Days_to_ship_id | string     | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :orders

## orders テーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |
| nickname    | string | null: false               |
| email       | string | null: false, unique:true  |
| Birth_month | date   | null: false               |
| birth_day   | date   | null: false               |

### Association

- belongs_to :from

## address テーブル

| Column       | Type   | Options                         |
| ------------ | ------ | ------------------------------- |
| Postal_code  | date   |  null: false                    |
| from_city    | string |  null: false                    |
| from_town    | string |  null: false                    |
| from_address | string |  null: false                    |
| orders_id    | string |  null: false, foreign_key: true |

### Association

- has_one :orders
