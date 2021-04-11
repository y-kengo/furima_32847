# テーブル設計

## usersテーブル

| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| family_name        | string     | null:false                    |
| first_name         | string     | null:false                    |
| family_name_kana   | string     | null:false                    |
| first_name_kana    | string     | null:false                    |
| nickname           | string     | null:false                    | 
| birth_day          | date       | null:false                    |
| email              | string     | null:false,unique: true       |
| encrypted_password | string     | null:false                    |

### Association
- has_many :products
- has_many :orders

## productsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null:false                     |
| description        | text       | null:false                     |
| category_id        | integer    | null:false                     |
| status_id          | integer    | null:false                     |
| shipping_id        | integer    | null:false                     |
| area_id            | integer    | null:false                     |
| day_id             | integer    | null:false                     |
| price              | integer    | null:false                     |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :address

## addressesテーブル
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| postal_code        | string     | null:false                     |
| area_id            | integer    | null:false                     |
| city               | string     | null:false                     |
| address            | string     | null:false                     |
| building           | string     |                                |
| phone_number       | string     | null:false                     |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order
