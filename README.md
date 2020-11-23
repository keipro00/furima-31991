<!-- テーブル設計 -->

<!-- users テーブル -->
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | text   | null: false |
| first_name         | text   | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth day          | date   | null: false |

<!-- Association -->
has_many :items
has_many :comments
has_many :user_items

<!-- itemsテーブル -->
| Column           | Type       | Options         |
| ---------------- | ---------- | --------------- |
| name             | string     | null: false     |
| comment          | text       | null: false     |
| category         | string     | null: false     |
| status           | string     | null: false     |
| delivery_fee_id  | integer    | null: false     |
| delivery_area_id | integer    | null: false     |
| delivery_days_id | integer    | null: false     |
| price            | integer    | null: false     |
| user             | references |                 | 

<!-- imageはActive Storageで実装 -->

<!-- Association -->
belongs_to :user
has_many :comments
belongs_to :user_item


<!-- commentsテーブル -->
| Column  | Type       | Options         |
| ------- | ---------- | --------------- |
| text    | text       | null:false      |
| item    | references |                 |
| user    | references |                 |

<!-- Association -->
belongs_to :user
belongs_to :item


<!-- deliveries -->
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postcode      | string     | null: false |
| prefecture_id | string     | null: false |
| city          | string     | null: false |
| block         | string     | null: false |
| building      | string     |             |
| phone         | string     | null: false |
| user_item     | references |             |

<!-- Association -->
has_many :user_items


<!-- user_items -->
| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | references |             |
| item    | references |             |

<!-- Association -->
belong_to :user
has_many :items
belong_to :deliveries