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

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type        | Option                         |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| description        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| status_id          | integer     | null: false                    |
| shipping_id        | integer     | null: false                    |
| shipment_source_id | integer     | null: false                    |
| day_id             | integer     | null: false                    |
| price              | string      | null: false                    |
| user_id            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| order_id           | references | null: false, foreign: true    |
| postal_code        | string     | null: false                   |
| shipment_source_id | integer    | null: false                   |
| city               | string     | null: false                   |
| house_number       | string     | null: false                   |
| building           | string     | null: true                    |
| tel_number         | string     | null: false                   |

### Association

- belongs_to :order