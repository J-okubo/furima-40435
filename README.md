# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | -------| --------------------------|
| nickname           | string | null: false               |
| email_address      | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_zen     | string | null: false               |
| last_name_zen      | string | null: false               |
| first_name_han     | string | null: false               |
| last_name_han      | string | null: false               |
| date_of_birth      | date   | null: false               |

## Shipping_addressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefecture        | string     | null: false                    |
| street_address    | string     | null: false                    |
| phone_number      | number     | null: false                    |
| user_id           | references | null: false ,foreign_key: true |

## item_comments テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_list_id | references | null: false, foreign_key: true |

## items_list テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| item_description       | text       | null: false                    |
| item_genre_id          | text       | null: false                    |
| item_condition_id      | text       | null: false                    |
| delivery_charge_id     | text       | null: false                    |
| ship_from_location_id  | text       | null: false                    |
| transit_time_id        | text       | null: false                    |
| item_price_id          | text       | null: false                    |
| user_id                | references | null: false, foreign_key: true |
| item_comments_id       | references | null: false, foreign_key: true |
