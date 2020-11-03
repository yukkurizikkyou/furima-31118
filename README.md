# README

# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| --------                  | ------ | ----------- |
| name                      | string | null: false |
| email                     | string | null: false |
| encrypted_password        | string | null: false |
| first-name                | string | null: false |
| last-name                 | string | null: false |
| first-name-kana           | string | null: false |
| last-name-kana            | string | null: false |
| birthday                  | date   | null: false |



### Association

- has_many : items
- has_one : purchases

## items テーブル

| Column          | Type    |  Options                      |
| ------          | ------  | -----------                   |
| days            | integer | null: false                   |
| item-name       | text    | null: false                   |  
| explanation     | integer | null: false                   |
| category_id     | integer | null: false                   |
| condition_id    | integer | null: false                   |
| delivery-fee_id | integer | null: false                   |
| area_id         | integer | null: false                   |
| price           | integer | null: false                   |
| user_id         | integer | null: false, foreign_key: true|



### Association

- belongs_to :user
- has_one : purchases

## addresses テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| postal-code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house-number | integer    | null: false                    |
| building     | string     | null: false                    |
| phone-number | string     | null: false                    |



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