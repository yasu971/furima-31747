# README
DB設計

users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false,unique: true |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string   | null: false |
| birthday           | date     | null: false |

### Association
- has_many :items
- has_many :purchases

items テーブル
| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| name                     | string     | null: false |
| description              | text       | null: false |
| category_id              | integer    | null: false |
| item_condition_id        | integer    | null: false |
| delivery_fee_burden_id   | integer    | null: false |
| exhibitor_prefectures_id | integer    | null: false |
| delivery_period_id       | integer    | null: false |
| price                    | integer    | null: false |
| user                     | references | foreign_key |

### Association
- belongs_to :user
- has_one :purchase

purchases テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | references | foreign_key |
| item              | references | foreign_key |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

addresses テーブル
| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| purchase                 | references | foreign_key |
| postal_code              | string     | null: false |
| purchaser_prefectures_id | integer    | null: false |
| municipality             | string     | null: false |
| house_number             | string     | null: false |
| building_name            | string     |             |
| telephone_number         | string     | null: false |

### Association
- belongs_to :purchase