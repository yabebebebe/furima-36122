
# テーブル設計

## usersテーブル

| Colum              | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| name_reading       | string  | null: false |
| birth_year_id      | integer | null: false |
| birth_month_id     | integer | null: false |
| birth_date_id      | integer | null: false |

### Association

- has_many   :items
- has_many   :orders
- belongs_to :birth_year
- belongs_to :birth_month
- belongs_to :birth_date

## itemsテーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| charge_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| date_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- belongs_to :category
- belongs_to :state
- belongs_to :charge
- belongs_to :area
- belongs_to :date


## ordersテーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :order