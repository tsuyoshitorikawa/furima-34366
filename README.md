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
- has_many :orders

## items テーブル

|    Column         | Type       | Options                        |
| ----------------- | ---------- | -----------------------------^ |
| product name      | string     | null: false                    |
| description_name  | text       | null: false                    |
| price             | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| burden_id         | integer    | null: false                    |
| delivery_state_id | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| day_to_ship_id    | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| postal_code   | string     |  null: false                    |
| area_id       | integer    |  null: false                    |
| from_city     | string     |  null: false                    |
| from_address  | string     |  null: false                    |
| building_name | string     |                                 |
| phone_number  | string     |  null: false                    |
| order         | references |  null: false, foreign_key: true |

### Association

- belongs_to :order
