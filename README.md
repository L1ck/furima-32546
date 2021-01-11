# テーブル 設計

## users テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| name_first         | string              | null: false             |
| name_second        | string              | null: false             |
| kana_first         | string              | null: false             |
| kana_second        | string              | null: false             |
| birth_year         | string              | null: false             |
| birth_month        | string              | null: false             |
| birth_day          | string              | null: false             |

### Association

* has_many :products
* has_one  :buyers

## products テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| description        | string              | null: false             |
| category           | string              | null: false             |
| state              | string              | null: false             |
| delivery_fee       | string              | null: false             |
| area               | string              | null: false             |
| delivery_day       | string              | null: false             |
| price              | string              | null: false             |
| user               | references          | foreign_key: true       |

### Association

* belongs_to :users
* has_one    :buyers

## buyers テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| card_number        | string              | null: false             |
| expiration_month   | string              | null: false             |
| expiration_year    | string              | null: false             |
| security_code      | string              | null: false             |
| zipcode            | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| district           | string              | null: false             |
| building           | string              | null: false             |
| phone_number       | string              | null: false             |
| user               | references          | foreign_key: true       |
| product            | references          | foreign_key: true       |

### Association

* belongs_to :users
* belongs_to :products