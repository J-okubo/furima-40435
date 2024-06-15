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

-has_many :item_comments
-has_many :items_purchases
-has_many :items_lists

## shipping_addressesテーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | -------------------------------|
| post_code             | string     | null: false                    |
| ship_from_location_id | integer    | null: false                    |
| street_address        | string     | null: false                    |
| street_number         | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| items_purchase        | references | null: false, foreign_key: true |

## Association
-belongs_to :user
-has_one:item_list

## item_comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item_list    | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item_list

## items_lists テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| item_description       | text       | null: false                    |
| item_genre_id          | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| delivery_charge_id     | integer    | null: false                    |
| ship_from_location_id  | integer    | null: false                    |
| transit_time_id        | integer    | null: false                    |
| item_price             | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_many :item_comments
-has_one::items_purchase

## items_purchases テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| items_list  | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :shipping_address
-belongs_to :items_list
