
# テーブル設計

## usersテーブル

| Colum              | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_reading  | string  | null: false               |
| first_name_reading | string  | null: false               |
| birthday_id        | day     | null: false               |

### Association

- has_many   :items
- has_many   :orders

## itemsテーブル

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| state_id      | integer    | null: false                    |
| charge_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| date_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- belongs_to :category
- belongs_to :state
- belongs_to :charge
- belongs_to :prefecture
- belongs_to :date


## ordersテーブル

| Colum | Type       | Options                        |
| ------| ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

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
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order