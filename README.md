# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | --------| ----------- |
| first_name      | string  | null: false |
| first_name_kana | string  | null: false |
| last_name       | string  | null: false |
| last_name_kana  | string  | null: false |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| title    | string  | null: false |
| derivery | string  | null: false |
| ditail   | string  | null: false |
| explain  | text    | null: false |
| price    | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image
- has_one :buys


## buys テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| user     | references |             |
| item     | references |             |

### Association

- belongs_to :item
- belongs_to :user

- has_one :addresses

# address テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| address  | text       | null: false |

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