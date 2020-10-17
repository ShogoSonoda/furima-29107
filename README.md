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

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| image           | string  | null:false |
| name            | string  | null:false |
| text            | text    | null:false |
| category        | string  | null:false |
| status          | string  | null:false |
| shipping        | string  | null:false |
| shipment-source | string  | null:false |
| days            | string  | null:false |
| price           | string  | null:false |

### Association

- has_one :users
- has_one :purchase

## purchase テーブル

| Column  | Type   | Option     |
| ------- | ------ | ---------- |
| address | string | null:false |
| card    | string | null:false |

### Association

- belongs_to :items