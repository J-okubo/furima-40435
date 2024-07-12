# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_zen     | string | null: false               |
| last_name_zen      | string | null: false               |
| first_name_han     | string | null: false               |
| last_name_han      | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :item_comments
- has_many :orders
- has_many :items

## shipping_addressesテーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | -------------------------------|
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| street_address | string     | null: false                    |
| street_number  | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one:item

## item_comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| genre_id           | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| transit_time_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_comments
- has_one:order

## orders テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping_address
- belongs_to :item
