# README
DB設計

users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false,unique: true |
| password        | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birthday        | date     | null: false |

### Association
- has_many :items
- has_many :purchases

items テーブル
| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| name                  | text       | null: false |
| description           | text       | null: false |
| category              | string     | null: false |
| item_condition        | string     | null: false |
| delivery_fee_burden   | boolean    | null: false |
| exhibitor_prefectures | string     | null: false |
| delivery_period       | string     | null: false |
| price                 | integer    | null: false |
| user_id               | references |             |

### Association
- belongs_to :users
- has_one :purchase

purchases テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| current_user_id   | references |             |
| item_id           | references |             |
| purchase_datetime | datetime   | null: false |

### Association
- belongs_to :users
- belongs_to :items
- has_one :profile

addresses テーブル
| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| Postal_code           | integer  | null: false |
| purchaser_prefectures | string   | null: false |
| municipality          | string   | null: false |
| house_number          | string   | null: false |
| building_name         | string   | null: false |
| telephone_number      | string   | null: false |

### Association
- belongs_to :purchases