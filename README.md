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
| name                  | string     | null: false |
| description           | text       | null: false |
| category              | integer    | null: false |
| item_condition        | integer    | null: false |
| delivery_fee_burden   | integer    | null: false |
| exhibitor_prefectures | integer    | null: false |
| delivery_period       | integer    | null: false |
| price                 | integer    | null: false |
| user_id               | references |             |

### Association
- belongs_to :users
- has_one :purchase

purchases テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| current_user_id   | references | foreign_key |
| item_id           | references |             |
| purchase_datetime | datetime   | null: false |

### Association
- belongs_to :users
- belongs_to :items
- has_one :profile

addresses テーブル
| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| postal_code           | string   | null: false |
| purchaser_prefectures | string   | null: false |
| municipality          | string   | null: false |
| house_number          | string   | null: false |
| building_name         | string   |             |
| telephone_number      | string   | null: false |

### Association
- belongs_to :purchases