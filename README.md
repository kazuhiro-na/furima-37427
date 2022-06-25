## usersテーブル

| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| nickname           | string | null, false               |
| email              | string | null, false, unique: true |
| encrypted_password | string | null, false               |
| name_sei           | string | null, false               |
| name_mei           | string | null, false               |
| name_sei_kana      | string | null, false               |
| name_mei_kana      | string | null, false               |
| birthday           | date   | null, false               |

### Association

- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null, false                    |
| explanation      | text       | null, false                    |
| category_id      | integer    | null, false                    |
| condition_id     | integer    | null, false                    |
| burden_id        | integer    | null, false                    |
| prefecture_id   | integer    | null, false                    |
| shipping_day_id | integer    | null, false                    |
| price            | integer    | null, false                    |
| user             | references | null, false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_recordsテーブル
| Column | Type       | Options                        |
| ----   | ---------- | ------------------------------ |
| user   | references | null, false, foreign_key: true |
| item   | references | null, false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_record

## shipping_addressesテーブル
| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null, false                   |
| prefecture_id  | integer    | null, false                   |
| municipalities  | string     | null, false                   |
| address         | string     | null, false                   |
| building        | string     |                               |
| purchase_record | references | null, false, foreign_key: true|
| tell            | string     | null, false                    |
### Association

- belongs_to :purchase_record