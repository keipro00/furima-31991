<!-- テーブル設計 -->

<!-- users テーブル -->
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

<!-- Association -->
has_many :items
has_many :comments
has_many :user_items

<!-- itemsテーブル -->
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| comment          | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_days_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key :true | 

<!-- imageはActive Storageで実装 -->

<!-- Association -->
belongs_to :user
has_many :comments
has_one :user_item


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
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postcode      | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| block         | string     | null: false       |
| building      | string     |                   |
| phone         | string     | null: false       |
| user_item     | references | foreign_key :true |

<!-- Association -->
belongs_to :user_item


<!-- user_items -->
| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key :true |
| item    | references | foreign_key :true |

<!-- Association -->
belongs_to :user
belongs_to :item
has_one :delivery