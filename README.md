# README

# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| --------                  | ------ | ----------- |
| name                      | string | null: false |
| email                     | string | null: false |
| encrypted_password        | string | null: false |
| first_name                | string | null: false |
| last_name                 | string | null: false |
| first_name-kana           | string | null: false |
| last_name-kana            | string | null: false |
| birthday                  | date   | null: false |



### Association

- has_many : items
- has_many : purchases

## items テーブル

| Column          | Type    |  Options                      |
| ------          | ------  | -----------                   |
| name            | string   | null: false                   |  
| explanation     | text    | null: false                   |
| category_id     | integer | null: false                   |
| days_id         | integer | null: false                   |
| condition_id    | integer | null: false                   |
| delivery_fee_id | integer | null: false                   |
| area_id         | integer | null: false                   |
| price           | integer | null: false                   |
| user_id         | integer | null: false, foreign_key: true|



### Association

- belongs_to :user
- has_one : purchases

## addresses テーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchases      | references | null: false, foreign_key: true |



### Association

- belongs_to : purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to : item
- belongs_to : user
  has_one : address