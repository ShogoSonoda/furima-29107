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
| last_name(kana)  | string | null: false |
| first_name(kana) | string | null: false |
| birth_data       | data   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type    | Option     |
| ------------------ | ------- | ---------- |
| image              | string  | null:false |
| name               | string  | null:false |
| text               | text    | null:false |
| category_id        | integer | null:false |
| status_id          | integer | null:false |
| shipping_id        | integer | null:false |
| shipment_source_id | integer | null:false |
| days_id            | integer | null:false |
| price              | string  | null:false |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type    | Option     |
| ------------ | ------- | ---------- |
| postal_code  | string  | null:false |
| prefecture   | integer | null:false |
| city         | string  | null:false |
| house_number | integer | null:false |
| building     | string  | null:true  |
| tel_number   | integer | null:false |

### Association

- belongs_to :purchase