# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | --------| ----------- |
| name     | string  | null: false |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| birthday | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :buys

## comments テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :user
- belongs_to :item




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



## buys テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| credit   | integer  | null: false |
| derivery | text     | null: false |

### Association

- belongs_to :user