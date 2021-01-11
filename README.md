# テーブル 設計

## users テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| name_first         | string              | null: false             |
| name_second        | string              | null: false             |
| kana_first         | string              | null: false             |
| kana_second        | string              | null: false             |
| birth              | date                | null: false             |

### Association

* has_many :products
* has_one  :buyers
* has_many :addresses

## products テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| description        | text                | null: false             |
| category_id        | integer             | null: false             |
| state_id           | integer             | null: false             |
| delivery_fee_id    | integer             | null: false             |
| area_id            | integer             | null: false             |
| delivery_day_id    | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | foreign_key: true       |

### Association

* belongs_to :user
* has_one    :buyer

## buyers テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| product            | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :product
* has_many :address

## addresses テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| zipcode            | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| district           | string              | null: false             |
| building           | string              | null: false             |
| phone_number       | string              | null: false             |
| user               | references          | foregn_key: true        |
| buyer              | references          | foregn_key: true        |

### Association

* belongs_to :user
* belongs_to :buyer