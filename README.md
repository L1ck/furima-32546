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

* has_many :items
* has_many :orders

## items テーブル

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
* has_one    :order

## orders テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :item
* has_one    :address

## addresses テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| zipcode            | string              | null: false             |
| area_id            | integer             | null: false             |
| city               | string              | null: false             |
| district           | string              | null: false             |
| building           | string              |                         |
| phone_number       | string              | null: false             |
| order              | references          | foregn_key: true        |

### Association

* belongs_to :order