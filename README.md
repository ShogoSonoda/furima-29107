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

| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| image           | string  | null:false |
| name            | string  | null:false |
| text            | text    | null:false |
| category        | integer | null:false |
| status          | integer | null:false |
| shipping        | integer | null:false |
| shipment_source | integer | null:false |
| days            | integer | null:false |
| price           | string  | null:false |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column       | Type    | Option     |
| ------------ | ------- | ---------- |
| postal_code  | integer | null:false |
| prefecture   | integer | null:false |
| city         | string  | null:false |
| house_number | integer | null:false |
| building     | string  | null:true  |
| tel_number   | integer | null:false |

### Association

- belongs_to :purchases