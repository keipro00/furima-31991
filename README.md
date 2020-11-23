<!-- テーブル設計 -->

<!-- users テーブル -->
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| users_nickname        | string | null: false |
| users_email           | string | null: false |
| users_password        | string | null: false |
| users_last_name       | text   | null: false |
| users_first_name      | text   | null: false |
| users_last_name_kana  | string | null: false |
| users_first_name_kana | string | null: false |
| users_birth day       | string | null: false |

<!-- Association -->
has_many :items
has_many :comments


<!-- itemsテーブル -->
| Column                | Type       | Options         |
| --------------------- | ---------- | --------------- |
| items_image           |            | Active Storage  |
| items_name            | text       | null: false     |
| items_comment         | text       | null: false     |
| items_category        | string     | null: false     |
| items_status          | string     | null: false     |
| items_delivery_fee    | string     | null: false     |
| items_delivery_area   | string     | null: false     |
| items_delivery_days   | string     | null: false     |
| items_price           | integer    | null: false     |
| items_fee             | integer    | null: false     |
| items_profit          | integer    | null: false     |
| user_id               | references |                 | 

<!-- Association -->
belongs_to :user
has_many :comments
belongs_to :delivery
belongs_to :card


<!-- commentsテーブル -->
| Column        | Type       | Options         |
| ------------- | ---------- | --------------- |
| comments_text | text       | null:false      |
| item_id       | references |                 |
| user_id       | references |                 |

<!-- Association -->
belongs_to :user
belongs_to :item


<!-- cardsテーブル -->
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| card_number         | integer    | null: false |
| card_deadline_month | integer    | null: false |
| card_deadline_year  | integer    | null: false |
| card_cvc            | integer    | null: false |
| item_id             | references |             |

<!-- Association -->
has_many :items
has_many :card_deliveries


<!-- deliveries -->
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| deliveries_postcode   | integer    | null: false |
| deliveries_prefecture | string     | null: false |
| deliveries_city       | string     | null: false |
| deliveries_block      | integer    | null: false |
| deliveries_building   | string     | null: false |
| deliveries_phone      | integer    | null: false |
| item_id               | references |             |

<!-- Association -->
has_many :items
has_many :card_deliveries


<!-- cards_deliveries -->
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| card_id     | references |             |
| delivery_id | references |             |

<!-- Association -->
belong_to :card
belong_to :deliveries