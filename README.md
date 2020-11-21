# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchase_histories
- has_many :sending_destinations


## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| introduction        | text    | null: false |
| price_id            | integer | null: false |
| item_condition_id   | integer | null: false ,foreign_key: true|
| category_id         | integer | null: false ,foreign_key: true|
| delivery_fee_id     | integer | null: false ,foreign_key: true|
| preparetion_day_id  | integer | null: false ,foreign_key: true|
| trading_states_id   | integer | null: false |
| user                | references | null: false ,foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase_history

## purchase_histry テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false ,foreign_key: true|
| item   | references | null: false ,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one : senging_destination


### sending_destinations テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | string     | null: false |
| prefecture_code    | integer    | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| bilding_number     | string     |             |
| phone_number       | string     | null: false |
| purchase_history | references | null: false ,foreign_key: true|

### Association
- belongs_to ::purchase_history
