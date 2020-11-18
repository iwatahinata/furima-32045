# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | --------| ----------- |
| first_name         | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name          | string  | null: false |
| last_name_kana     | string  | null: false |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| explain       | text       | null: false       |
| item_category | string     | null: false       |
| item_status   | string     | null: false       |
| derivery_fee  | string     | null: false       |
| derivery_area | string     | null: false       |
| derivery_days | string     | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image
- has_one :buy


## buys テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :house

# houses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| cities       | string  | null: false |
| address      | integer | null: false |
| house_name   | string  |             |
| phone_number | integer | null: false |

### Association

- belongs_to :buy

## comments テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :user
- belongs_to :item